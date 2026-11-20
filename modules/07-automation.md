# 07 — ⭐ Automation: let the agent keep going without you

⏱ 45 min · [← Previous](06-subagents-and-orchestration.md) · [Next: Putting it together →](08-putting-it-together.md)

## Why it matters

So far, nothing happens unless you type. Every step waits for you: "now do this", "now check that", "keep going". **Automation means the agent keeps working without you pressing the button each time**, while you stay in control of the important decisions.

## The concept in one table

The only question that matters is: **who presses the button?**

| Kind | Who presses the button | Plain-English example | Section |
|---|---|---|---|
| **Hook** | An **event** ("the agent just finished", "the agent is about to edit a file") | "When you finish, beep." / "Before you change any file, explain why." | 1 |
| **Loop** | **The agent itself**, until a stop condition is met | "Keep improving this until all the checks pass, maximum 10 rounds." | 2 |
| **Parallel / background work** | **The orchestrator**, which starts several helpers at once | "Run these 3 specialists at the same time and tell me when they're all done." | 3 |
| **Schedule** *(optional)* | **The clock** | "Every Monday at 9:00, health-check my vault." | 4 |

Hooks, loops and parallel work are the ones used day to day in the case-study setup from module 06. Schedules are a natural next step, but optional.

> 💡 **Automate only what you've done by hand and checked a few times.** Automating something you don't understand just produces mistakes faster.

---

## 1. Hooks: "when X happens, do Y" (🟣 Claude Code)

A **hook** is a rule attached to an event in the agent's life: the session starts, you send a message, the agent is about to use a tool, the agent just finished… Hooks are stored in `~/.claude/settings.json` (all projects) or `.claude/settings.json` (one project), and plugins can install their own. Type `/hooks` in Claude Code to see the ones you have.

### Example A: a sound when the agent finishes (comfort)

Long tasks take minutes. A `Stop` hook plays a beep when the agent is done, so you can do something else meanwhile. See [`claude-hooks-example.json`](../config-examples/automation/claude-hooks-example.json):

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

On macOS, use `afplay /System/Library/Sounds/Glass.aiff` as the command. Easiest install: ask Claude Code *"Add a Stop hook to my user settings that plays a beep."*

### Example B: a guard that forces the agent to think first (safety)

The [ECC](https://github.com/affaan-m/ECC) plugin installs a guard hook called **GateGuard**. Before the agent creates or edits a file, or runs its first command, the hook **blocks the action** and makes the agent first state:
- what you actually asked for (quoted word for word),
- which other files depend on the file it's about to change,
- what data it will read or write.

Only then can it retry. This stops a whole class of mistakes: editing the wrong file, inventing data structures, drifting away from the request.

**The trade-off is real.** While this course was being written, GateGuard fired dozens of times, once for every new file. It's safer, but slower and uses more tokens. Guards are worth it on important projects; you can exempt folders where they only add friction (ECC lets you list exempt paths).

> A hook runs a real command on your computer. Only add hooks you understand, from sources you trust.

🪿 **Goose** has no hooks in this sense. Its closest equivalent is the *Top Of Mind* extension, which injects a fixed reminder into every turn ("always state your plan before editing").

---

## 2. Loops: the agent presses the button itself

A loop repeats work until a **stop condition** is met. Three levels:

### Level 1: just ask (any agent)

> Run the vault lint, fix every safe issue, then lint again. Repeat until it's clean, **maximum 3 rounds**. List anything you couldn't fix.

Always give **a stop condition and a maximum**. Without them, a loop can run (and spend) much longer than you intended.

### Level 2: the Ralph loop (🟣 Claude Code plugin)

**ralph-loop** is an official Claude Code plugin. You give it a task once, and it uses a `Stop` hook (see section 1) to **feed the same prompt back every time the agent tries to finish**. The agent sees its own previous work in the files and keeps improving it, until it writes a "completion promise" you defined, or hits the maximum number of rounds.

```
/ralph-loop "Polish module 03 of my course until every exercise has a clear 'check you got it' list. Say <promise>DONE</promise> when finished." --completion-promise "DONE" --max-iterations 10
```

- Install: type `/plugin` in Claude Code, find **ralph-loop** in the official marketplace.
- Stop it any time with `/cancel-ralph`.
- On Windows its hook is a Bash script, so it needs **Git for Windows** installed (Claude Code recommends it anyway).
- Best for work with an objective finish line: "all checks pass", "every page has X". Bad for vague goals like "make it better", which never finish.

### Level 3: a written improvement loop (case study, any agent)

The most powerful loop isn't a plugin. It's **a process document the orchestrator follows**, cycle after cycle, until the backlog is done. The team from module 06 used one with six phases:

| Phase | Who | What happens |
|---|---|---|
| **1. Scan** | dogfood + uiux | Test the product, score it against written design principles, list findings |
| **2. Plan** | pm | Pick the next batch of backlog items, split them into slices for specialists |
| **3. Build** | builders, in parallel where safe | Implement the slices; each must report test evidence |
| **4. Verify** | orchestrator | QA gate: tests pass, the targeted principles are now met. **Max 3 retries per slice**, then escalate to the human |
| **5. Human review** | **you** | The only mandatory human step: open the product, click through, give design feedback |
| **6. Dogfood + reflect** | dogfood + orchestrator | Use it as a real user, compare scores with the last cycle, mark the batch done, **write a cycle summary to the vault** |

Then it starts again with the next batch, **until every backlog item is done**. That's the stop condition.

What makes it safe enough to run on its own:
- **Escalation gates:** the loop stops and asks you when a slice fails 3 times, when the same problem comes back 3 cycles in a row, when there's no progress across 3 batches, or when a strategic decision is needed.
- **Human gate on taste:** the one thing models judge badly (does this *feel* right?) stays with you.
- **Memory after every cycle:** each cycle writes its summary to the vault, so the next cycle, or a new session, knows what happened.

You can write the same kind of loop for non-software work: *scan* a document against criteria → *plan* fixes → *write* → *fact-check* (QA gate) → *your review* → *reflect and log*.

---

## 3. Parallel and background work

When the orchestrator dispatches several specialists at once (module 06), it doesn't wait for each one before starting the next:

- 🪿 **Goose:** the `delegate` tool has an `async: true` option. The orchestrator starts several specialists and collects their reports as they finish.
- 🟣 **Claude Code:** ask for subagents "in parallel"; they can run in the background while you keep talking to the main agent.

The rules from [TEAM.md](../config-examples/orchestration/TEAM.md) apply: parallel only for read-only work or for writes to *different* files.

When you keep several long sessions running at once, a workspace manager like **[Herdr](https://herdr.dev)** shows which one is waiting for you, and keeps them running in the background, even on a remote server. See [module 06](06-subagents-and-orchestration.md#running-several-agents-side-by-side) and the [Toolbox](../TOOLBOX.md#3-running-several-agents-side-by-side).

ECC adds loop and safety tooling worth knowing: `continuous-agent-loop` (quality gates and recovery for long loops), `santa-method` (two independent reviewers must both approve before anything ships), and `safety-guard` (confirm dangerous commands, lock writes to one folder). See the [ECC guide](../guides/ecc.md).

---

## 4. Optional next step: schedules (the clock presses the button)

None of the above needs a schedule. But once a workflow is reliable, you can run it at fixed times, for example a weekly vault health check. Two ingredients:

**a) A headless run:** the agent runs from one command, does the job and exits, with no chat window. Try it by hand first, from your vault folder:

```powershell
claude -p "Run the vault-lint skill and write the report to sessions/." --allowedTools "Read,Write,Edit,Glob,Grep"
```
```powershell
goose run -t "Lint this vault following AGENTS.md and write the report to sessions/."
```
*What this is: `-p` / `run -t` = run this one prompt and exit. `--allowedTools` = the only tools Claude may use, since nobody is there to approve anything. Here it can read and write notes, but can't run commands or browse.*

**b) A scheduler:**
- 🪿 **Goose** has one built in: sidebar → **Scheduler** → **Create Schedule**, using the ready-made recipe [`weekly-vault-lint.yaml`](../config-examples/goose-recipes/weekly-vault-lint.yaml) (set your vault path in it first). Or from the CLI:
  ```powershell
  goose schedule add --schedule-id weekly-lint --cron "0 0 9 * * 1" --recipe-source .\weekly-vault-lint.yaml
  ```
  `goose schedule run-now --schedule-id weekly-lint` tests it immediately; `goose schedule remove --schedule-id weekly-lint` deletes it. *(Cron is a compact way to write times; `0 0 9 * * 1` = second 0, minute 0, 9 o'clock, every Monday.)*
- 🟣 **Claude:** ask the Claude desktop app to create a scheduled task, or use Windows Task Scheduler with the runner script [`run-weekly-lint.ps1`](../config-examples/automation/run-weekly-lint.ps1) (instructions inside the file).

Check the first few reports carefully. **If it isn't good when you're watching, it won't be good at 9:00 on Monday.**

---

## Try it (25 min)

1. **Hook:** add the finish beep. Start a long task and walk away until you hear it.
2. **Loop:** run a level-1 loop on your vault ("lint, fix, repeat, max 3 rounds"). If you're on Claude Code, try one Ralph loop with a clear finish line and `--max-iterations 5`.
3. **Write your own improvement loop:** take a recurring piece of work (a weekly report, a newsletter, a product). Write its phases, its QA gate, where *you* step in, and its stop condition, in a note in your vault. That document *is* the automation: next time, tell the agent "run one cycle of <note>".
4. *(Optional)* Schedule the weekly lint and test it with `run-now`.

## 🔒 Automation safety checklist

- [ ] Every loop has a **stop condition and a maximum**.
- [ ] I know how to stop it (`/cancel-ralph`, closing the session, `goose schedule remove …`).
- [ ] The human checks the things models judge badly (taste, strategy, anything irreversible).
- [ ] Every cycle or run writes a **report to the vault**, so I can see what it did.
- [ ] Unattended runs get the minimum tools: read/write notes, no sending, no deleting, no payments.
- [ ] Nothing automated processes untrusted content (random emails, unknown websites) with write or send permissions.

## How it connects

Automation is where everything pays off: **skills** (04) define the work, **memory** (03) carries results from one cycle to the next, **subagents and the team** (06) do the work inside each cycle, and **connectors** (05) bring in fresh data.

## Go deeper

- [Claude Code — hooks guide](https://code.claude.com/docs/en/hooks-guide) · [headless mode](https://code.claude.com/docs/en/headless)
- [Goose — recipes](https://goose-docs.ai/docs/guides/recipes/session-recipes) · [CLI commands, including `schedule`](https://goose-docs.ai/docs/guides/goose-cli-commands)
- [ECC](https://github.com/affaan-m/ECC) (GateGuard and other hooks)
