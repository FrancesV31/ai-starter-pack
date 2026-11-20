# AI Agent Starter Pack

**A hands-on course for non-developers who want to go from "chatting with an AI" to "working with AI agents that remember, delegate and run on their own."**

No coding required. You will type a few commands into a terminal, and every one of them is explained.

---

## Why this exists

Most people use AI like a very smart search box:

- Every conversation starts from zero. You re-explain who you are and what you're working on.
- Results are inconsistent, because the instructions change every time.
- Nothing compounds. What you figured out last week is lost in an old chat.

This pack fixes those three problems with three ideas:

| Problem | Idea | Module |
|---|---|---|
| "It forgets everything" | **Persistent memory** — a folder of notes (an Obsidian vault) that the agent reads at the start and updates at the end of every session | [03](modules/03-persistent-memory.md) |
| "I can only do one thing at a time" | **Subagents & orchestration** — the agent hands pieces of work to helper agents, each with a clean head and one job | [06](modules/06-subagents-and-orchestration.md) |
| "I still have to be there for everything" | **Automation** — hooks and loops that keep the agent working without you pressing the button each time | [07](modules/07-automation.md) |

By the end, your 10th session with an agent will be noticeably smarter than your 1st, because the agent will be reading what the first nine taught it.

---

## How the pieces fit together

```
                         YOU
                          │  ask · review · curate sources
                          ▼
     ┌─────────────────────────────────────────────┐
     │  AGENT  =  harness (body)  +  model (brain) │   Claude Code  or  Goose
     └──┬───────────┬──────────────┬───────────┬───┘
        │ reads     │ loads        │ calls     │ delegates
        ▼           ▼              ▼           ▼
   Standing      Skills        Connectors   Subagents
   instructions  (saved        (MCP: Drive, (helpers with a fresh
   (who you are, workflows)    calendar,     context, one job each)
    how to work)               docs, web)        │
        │                                        │ write their reports into
        ▼                                        ▼
   ┌─────────────────────────────────────────────────┐
   │  MEMORY VAULT (Obsidian) — plain Markdown files │  ◄─ read at start,
   │  sources → wiki pages → index → log             │     written at end
   └─────────────────────────────────────────────────┘
                          ▲
                          │ keeps the agent going without you
                    AUTOMATION (hooks · loops · parallel work · schedules)
```

Every box is a plain file or folder on your computer. That is the big secret: **there is no magic, only text files that the agent reads.** Once you see that, you can inspect, fix and improve everything yourself.

---

## Pick your path

Every module is written for both paths. You can switch later — the memory vault, skills and instructions are shared.

| | 🟣 **Claude path** | 🪿 **Goose path** |
|---|---|---|
| What | Claude Code (Anthropic's agent) | Goose (open-source agent, Agentic AI Foundation) |
| Model | Claude models | Any: Claude, GPT, Gemini, Mistral, local models via Ollama… |
| Cost | Claude Pro/Max subscription (Claude Code isn't on the free plan) | Free app. Pay your model provider per token, or run a local model for free. Claude models in Goose need an Anthropic API key, paid per token, separately from any Claude subscription |
| Best for | Best out-of-the-box experience | Choosing your own model or provider, or keeping costs near zero |

Not sure? Start with the Claude path if you already pay for Claude, otherwise the Goose path.

---

## The course

| # | Module | You'll understand | You'll have | Time |
|---|---|---|---|---|
| 00 | [How AI agents actually work](modules/00-how-agents-work.md) | Model vs harness, context window, why AI "forgets" | A mental model | 15 min |
| 01 | [Install your agent](modules/01-install-your-agent.md) | Terminals, permissions, providers | A working agent | 30 min |
| 02 | [Standing instructions](modules/02-standing-instructions.md) | How agents learn who you are | Your profile file | 15 min |
| 03 | ⭐ [Persistent memory with Obsidian](modules/03-persistent-memory.md) | The "LLM Wiki" pattern | A memory vault the agent maintains | 60 min |
| 04 | [Skills: saved workflows](modules/04-skills.md) | Why skills are cheap and portable | 5–10 skills installed | 20 min |
| 05 | [Connectors (MCP)](modules/05-connectors-mcp.md) | How agents plug into other software, and what it costs in tokens | 1 connector | 25 min |
| 06 | ⭐ [Subagents & orchestration](modules/06-subagents-and-orchestration.md) | Delegation, specialists, a real orchestrated team with a QA gate | A fact-checker + your team roster | 60 min |
| 07 | ⭐ [Automation](modules/07-automation.md) | Hooks, loops, parallel work (schedules optional) | A loop that runs until done | 45 min |
| 08 | [Putting it all together](modules/08-putting-it-together.md) | A real week of agent-assisted work | Your own operating system | 20 min |

Each module follows the same shape: **Why it matters → The concept → Install / set up → Try it → Check you got it → How it connects → Go deeper.**

---

## What's in this folder

```
ai-starter-pack/
├── README.md               ← you are here
├── GLOSSARY.md             ← every term, in plain English
├── RESOURCES.md            ← the reading list (articles, guides, repos)
├── modules/                ← the course
├── vault-template/         ← an empty memory vault, ready to open in Obsidian
├── skills/                 ← starter skills: the vault operations + fact-check
├── config-examples/        ← instruction templates, subagents (incl. fact-checker), team roster, recipes, automation
└── setup/                  ← scripts to check your install and copy the starter skills
```

## How to use this pack

1. Download this folder (on GitHub: **Code → Download ZIP**, then unzip it).
2. Read the modules in order. Do the **Try it** step of each one, because doing it is how it sticks.
3. Optional: open the whole folder in Obsidian (after module 03) to read it with clickable links.

## What you need

- A Windows 10/11 or macOS computer.
- About 4–5 hours in total, spread over a few days.
- One of: a Claude Pro/Max subscription, a model provider API key (a few dollars of credit is plenty to learn), or a reasonably recent computer to run a free local model.

---

*Commands are given for Windows (PowerShell) and macOS (Terminal). Tools change fast, so if a command fails, check the official docs linked in each module.*

## License & contributing

[MIT](LICENSE): free to use, copy and adapt. Found a broken command or an unclear step? Open an issue. That feedback is exactly what makes the course better for the next person.
