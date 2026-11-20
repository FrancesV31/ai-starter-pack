# 07 — ⭐ Automation: let it run without you

⏱ 45 min · [← Previous](06-subagents-and-orchestration.md) · [Next: Putting it together →](08-putting-it-together.md)

## Why it matters

Until now, nothing happens unless you're at the keyboard. But much of the value of a memory vault and an agent team comes from **regular, boring work done reliably**: processing your inbox, checking the vault's health, a weekly briefing. Automation turns your agent from a tool you use into a system that works for you.

## The concept: the automation ladder

Climb one rung at a time. Each rung builds on the one below.

| Rung | What | Example | You need |
|---|---|---|---|
| 1. **Saved workflow** | A skill or recipe: the *how* is written down | `vault-lint` skill | Module 04 |
| 2. **Loop** | Repeat until a goal is reached | "Keep fixing lint errors until there are none (max 5 rounds)" | A clear stop condition |
| 3. **Hook** | Something runs automatically *when an event happens* | "When the agent finishes, play a sound" | A settings file |
| 4. **Headless run** | Run the agent with one command, no chat window | `claude -p "Run the vault-lint skill"` | The CLI |
| 5. **Schedule** | Run a headless job at set times | Every Monday 9:00 | A scheduler |

> 💡 **Automate only what you've done by hand at least three times and checked.** Automating a workflow you don't understand just produces mistakes faster.

### Concepts you'll meet

- **Headless mode:** the agent runs from a single command, does the job, and exits. No chat. This is what schedulers call.
- **Permissions in headless mode:** nobody is there to click "approve", so you decide up front which tools are allowed. Start with **read + write notes only**, never sending, deleting or buying.
- **Cron:** a compact way to write schedules. `0 9 * * 1` means "minute 0, hour 9, any day of the month, any month, Monday". Goose's scheduler uses a version with a seconds field in front: `0 0 9 * * 1`.

---

## Rung 2 — Loops

Just ask, and always give a **stop condition** and a **maximum**:

> Run the vault lint. Fix every issue you can fix safely, then lint again. Repeat until clean, maximum 3 rounds. List anything you couldn't fix.

🟣 Claude Code also has a built-in `/loop` command that repeats a prompt on an interval (for example `/loop 10m check the inbox and ingest new files`) while the session is open. A plugin called **ralph-loop** keeps an agent working on one goal across many iterations. Powerful, but use it only with clear stop conditions.

## Rung 3 — Hooks (🟣 Claude Code)

Hooks live in `~/.claude/settings.json` (all projects) or `.claude/settings.json` (one project). Events include `SessionStart`, `UserPromptSubmit`, `PreToolUse`, `PostToolUse`, `Stop`, `SessionEnd` and more.

**Starter hook: a sound when the agent finishes**, so you can do something else during long tasks. See [`config-examples/automation/claude-hooks-example.json`](../config-examples/automation/claude-hooks-example.json):

```json
{
  "hooks": {
    "Stop": [
      { "hooks": [ { "type": "command",
        "command": "powershell -NoProfile -Command \"[console]::beep(880,200)\"" } ] }
    ]
  }
}
```

On macOS, replace the command with `afplay /System/Library/Sounds/Glass.aiff`.

The easiest way to add it: ask Claude Code *"Add a Stop hook to my user settings that plays a beep"*, then type `/hooks` to see it. Hooks run real commands on your computer, so only add hooks you understand.

🪿 Goose doesn't use hooks the same way. Its equivalents are recipes plus the scheduler (below), and the *Top Of Mind* extension, which injects a reminder into every turn.

## Rung 4 — Headless runs

Try it by hand first, from inside your vault folder:

🟣 **Claude Code:**
```powershell
cd "<path to your vault>"
claude -p "Run the vault-lint skill and write the report to sessions/." --allowedTools "Read,Write,Edit,Glob,Grep"
```
*What this is: `-p` = run this one prompt and exit; `--allowedTools` = the only tools it may use without asking. Here it can read and write notes, but not run commands or browse.*

🪿 **Goose:**
```powershell
cd "<path to your vault>"
goose run -t "Lint this vault following AGENTS.md and write the report to sessions/."
```
Or run a recipe: `goose run --recipe weekly-vault-lint.yaml --params vault_path="<path>"`.

Check the report it wrote. **If it's not good when you're watching, it won't be good at 9am on Monday.**

## Rung 5 — Schedules

### 🪿 Goose — built-in scheduler (easiest)

1. Copy [`config-examples/goose-recipes/weekly-vault-lint.yaml`](../config-examples/goose-recipes/weekly-vault-lint.yaml) and set your vault path as the parameter's default.
2. **Desktop:** sidebar → **Recipes** → import or open the recipe → **Create Schedule**. Or sidebar → **Scheduler** → **Create Schedule**.
   **CLI:**
   ```powershell
   goose schedule add --schedule-id weekly-lint --cron "0 0 9 * * 1" --recipe-source .\weekly-vault-lint.yaml
   goose schedule list
   goose schedule run-now --schedule-id weekly-lint
   ```
   `run-now` tests it immediately. Do this before you trust the schedule.

### 🟣 Claude Code — three options

- **Ask the desktop app.** In the Claude desktop app you can ask Claude to create a **scheduled task** ("every Monday at 9, lint my vault"). It runs while the app is open.
- **Cloud routines (`/schedule`).** These run on Anthropic's servers even when your computer is off. They work on a GitHub repository, so they suit a vault backed up to a private GitHub repo.
- **Your computer's scheduler.** Works for both agents, and runs even when no app is open:
  - **Windows Task Scheduler:** use the runner script [`config-examples/automation/run-weekly-lint.ps1`](../config-examples/automation/run-weekly-lint.ps1). Edit the vault path at the top, then register it once:
    ```powershell
    schtasks /create /tn "Weekly vault lint" /sc weekly /d MON /st 09:00 /tr "powershell -NoProfile -ExecutionPolicy Bypass -File C:\path\to\run-weekly-lint.ps1"
    ```
    *What this is: `schtasks` is Windows' built-in scheduler. `/sc weekly /d MON /st 09:00` = every Monday at 09:00.* Test it now with `schtasks /run /tn "Weekly vault lint"`, and remove it with `schtasks /delete /tn "Weekly vault lint"`.
  - **macOS:** use `cron` (`crontab -e`, then add `0 9 * * 1 cd "/path/to/vault" && claude -p "Run the vault-lint skill…" --allowedTools "Read,Write,Edit,Glob,Grep"`) or a calendar-triggered Shortcut.

## Try it (25 min) — your first automated job

1. Run the lint **by hand** in a session. Read the report. Adjust `AGENTS.md` if it flagged things wrongly.
2. Run it **headless** (rung 4). Compare it with the hand-run report.
3. **Schedule it** weekly (rung 5), and use `run-now` / `schtasks /run` to test it immediately.
4. Next Monday, open `sessions/` and find the report waiting for you.

**Stretch goal — the inbox processor:** a daily job that ingests whatever you clipped into `inbox/` the day before. Copy the lint recipe and change the prompt to "Ingest every file in inbox/ following AGENTS.md, then list what you added."

## 🔒 Automation safety checklist

- [ ] The job does something I've done by hand and checked at least 3 times.
- [ ] Its allowed tools are the minimum needed (read/write notes; no shell, no sending, no deleting).
- [ ] It writes a **report** to the vault every run, so I can see what it did.
- [ ] I've tested it with "run now" before trusting the schedule.
- [ ] I know how to stop it (`goose schedule remove …` / `schtasks /delete …`).
- [ ] I check its reports weekly, at least for the first month.
- [ ] It never processes untrusted content (random emails, unknown websites) with write or send permissions. That's how prompt injection does damage.

## How it connects

Automation is where everything pays off: **skills** (04) define the job, **memory** (03) holds the inputs and receives the reports, **subagents** (06) can do the heavy lifting inside the job, and **connectors** (05) bring in fresh data.

## Go deeper

- [Claude Code — headless mode](https://code.claude.com/docs/en/headless) · [hooks guide](https://code.claude.com/docs/en/hooks-guide)
- [Goose — recipes](https://goose-docs.ai/docs/guides/recipes/session-recipes) · [CLI commands, including `schedule`](https://goose-docs.ai/docs/guides/goose-cli-commands)
