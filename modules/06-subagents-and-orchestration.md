# 06 — ⭐ Subagents & orchestration: from one assistant to a team

⏱ 60 min · [← Previous](05-connectors-mcp.md) · [Next: Automation →](07-automation.md)

## Why it matters

Remember the whiteboard (module 00)? A big job like "research five competitors, compare them and write a recommendation" fills it fast: every web page read, every dead end. By the time the agent writes the recommendation, its whiteboard is cluttered and the quality drops.

**Subagents** solve this the way a manager would: hand each piece to a helper with a **clean whiteboard and one job**, and get back only a short report. **Orchestration** goes one step further: a whole team of specialists, each on the model that suits it, with rules for who does what and how the work is checked.

This module goes in three levels:

| Level | What you'll do | Time |
|---|---|---|
| **1. Delegate** | Ask your agent to use helpers, in plain language | 10 min |
| **2. Specialists** | Install named subagents, including a real fact-checker | 20 min |
| **3. A team** | Study a real orchestrated team and write your own roster | 30 min |

## The concept

### What a subagent is

```
                 MAIN AGENT (your session)
                 whiteboard: your goal + short reports only
                /            |             \
          delegate        delegate        delegate
             ▼               ▼               ▼
       ┌──────────┐    ┌──────────┐    ┌──────────┐
       │Subagent 1│    │Subagent 2│    │Subagent 3│   each: fresh whiteboard,
       │Competitor│    │Competitor│    │Competitor│   own instructions, own tools,
       │    A     │    │    B     │    │    C     │   possibly its own model
       └────┬─────┘    └────┬─────┘    └────┬─────┘
            └── 1-page report ──┴── 1-page report ──┘
                          ▼
              Main agent compares and recommends
```

Three benefits:

1. **Clean context.** The main agent keeps only the conclusions, not the 40 web pages behind them.
2. **Specialisation.** Each helper has its own instructions ("you are a rigorous fact-checker"), its own tools (read-only, say) and even its own model.
3. **Parallelism.** Independent pieces run at the same time.

The trade-off: subagents **don't see your conversation**. They know only what's in the hand-off. A vague brief gives a vague result.

### Five orchestration patterns

Almost every multi-agent setup is one of these, or a combination (adapted from Anthropic's *Building effective agents*):

| Pattern | Shape | Use when | Example |
|---|---|---|---|
| **Fan-out / fan-in** | Split → many in parallel → combine | Independent pieces of the same kind | Research 5 competitors at once |
| **Pipeline** | A → B → C, each step's output feeds the next | Work with clear stages | Spec → build → test |
| **Generator + critic** | One makes, one reviews, repeat until good | Quality matters more than speed | Draft → fact-check → revise |
| **Router** | Look at the request, send it to the right specialist | Mixed incoming work | "Is this research, writing or planning?" |
| **Orchestrator + team** | A lead plans, dispatches to specialists, gates the results | Bigger projects | The case study below |

**Rule of thumb:** start with *one* agent. Add subagents when the context gets cluttered or a job clearly splits.

### Memory makes teams work

Subagents forget everything when they finish, just like sessions. So **have them write their reports into the vault** (module 03). The main agent reads short reports, you review them in Obsidian, and next week's session builds on them. The vault becomes the team's **shared memory**.

---

## Level 1 — Delegate in plain language (10 min)

Both agents can create helpers on the fly. Pick a real question with 3 independent parts (3 tools, 3 cities, 3 job offers…):

> Use 3 subagents in parallel, one per option: A, B, C. Each writes a brief to my vault at domains/example-domain/wiki/research/<option>.md with pros, cons and sources. Then compare them in a table and recommend one.

- 🟣 Claude Code uses its built-in general-purpose subagent for this.
- 🪿 Goose uses its built-in *Summon* extension. Words like "in parallel" or "then" set the mode. Settings (environment variables): `GOOSE_MAX_CONCURRENT_SUBAGENTS` (default 5); `GOOSE_SUBAGENT_MODEL` / `GOOSE_SUBAGENT_PROVIDER` to run helpers on a cheaper model. Subagents are off in Goose's manual-approval modes.

Open the three briefs in Obsidian. Notice the main session stayed short.

---

## Level 2 — Named specialists (20 min)

A **named subagent** is a Markdown file: a description (so the main agent knows *when* to call it), a list of allowed tools, and its instructions.

| Agent | Where specialist files live |
|---|---|
| 🟣 Claude Code | `~/.claude/agents/<name>.md` (all projects) or `.claude/agents/<name>.md` (one project) |
| 🪿 Goose | No fixed folder: keep role files in your vault and ask Goose to *"use a subagent with the instructions in <file>"*, or package the role as a **recipe** ([example](../config-examples/goose-recipes/research-brief.yaml)) |

```markdown
---
name: fact-checker
description: Rigorous fact-checker. ... Use whenever the user wants to check the reliability of a text...
tools: Read, Glob, Grep, Write, WebSearch, WebFetch, Bash
---

You are a professional fact-checker, modelled on the verification desks of major newsrooms...
```

### Worked example: a skill that calls a subagent

The pack includes a real, battle-tested pair:

- **[`fact-checker`](../config-examples/subagents/fact-checker.md)** (the subagent): extracts every claim in a document, rates how critical each one is, checks each against independent sources by opening them, flags typical **AI mistakes** (invented sources, false precision, misattributed quotes, outdated data), and writes a report with a reliability score out of 10 and ready-to-paste corrections.
- **[`fact-check`](../skills/fact-check/SKILL.md)** (the skill): what you type, `/fact-check <file or URL>`. It packages your request and hands it to the subagent.

Why split it in two? The **skill** is the front door, short and cheap to keep loaded. The **subagent** does the heavy work on its own whiteboard: dozens of web pages read for verification never clutter your session. You only get back the score and the top corrections.

**Install** (🟣): `.\setup\install-starter-skills.ps1` installs the skills *and* copies the pack's subagents into `~/.claude/agents/`. It never overwrites files you already have.

**Try it:** ask your agent to write a short paragraph full of statistics on a topic you know, then: *"/fact-check what you just wrote."* Read the report. Agents are confident even when they're wrong, and this is your counterweight.

### Other beginner specialists in the pack

Written for this course, simple on purpose: **[researcher](../config-examples/subagents/researcher.md)** (sourced briefs), **[critic](../config-examples/subagents/critic.md)** (sceptical-investor review and pre-mortem) and **[note-keeper](../config-examples/subagents/note-keeper.md)** (files results into the vault). Try a **generator + critic** round:

> Draft a one-page proposal for <idea>. Then have the critic subagent review it. Revise based on its critique, and show me what changed.

For many more roles to read and adapt, see [VoltAgent's 100+ subagents](https://github.com/VoltAgent/awesome-claude-code-subagents) (business, research, product…) and ECC's 68 agents. The [ECC guide](../guides/ecc.md#ecc-beyond-claude-a-case-study) shows how to adapt them for Goose.

---

## Level 3 — Case study: a real orchestrated team (30 min)

Here is a setup that has actually been used to build and ship a web product. It shows what "advanced" looks like: not more agents, but **clear roles, the right model for each, and a gate that refuses work without proof.**

### The team

**Goose is the orchestrator.** It plans and dispatches to six specialists, each on a different model:

| Specialist | Does | Model (example) | Why |
|---|---|---|---|
| **pm** | Specs, slices, acceptance criteria | DeepSeek V4 Flash: fast, cheap | Structuring, not hard reasoning |
| **backend** | Data, business logic, APIs | Qwen3.6-35B: mid-size coder | Solid code at low cost |
| **frontend** | Screens, charts | GLM-5.2: strong coder | UI bugs are visible; quality pays |
| **uiux** | Design system, visual review at several screen sizes | Gemma 4: multimodal | Must look at screenshots |
| **devops** | Build, deploy, infrastructure | Qwen3.6-35B | Procedural work |
| **dogfood** | Uses the shipped product in a real browser, reports findings with screenshots | GLM-5.2 + browser automation | Judgement + real clicks |

Plus an **on-demand library of 68 specialist personas** (architect, code reviewer, security reviewer…), adapted from ECC, called only when a core specialist needs depth.

> 💡 This is where the Goose path shines: **each specialist can run on a different model and provider**, so you pay strong-model prices only where quality matters.

### How it runs

1. **Shared culture.** Every specialist receives the same short [CULTURE.md](../config-examples/orchestration/CULTURE.md): *build the doghouse, not the moonbase* (simplest thing that serves the user), *respect the altitude* (stay in your lane, report needs to the orchestrator), *proof over promises* ("I ran the tests and 658 passed" is proof, "it works" isn't).
2. **Dispatch with full context.** Culture + role file + project context + the slice with its acceptance criteria. Specialists start empty, so the brief carries everything.
3. **The QA gate.** Every builder must end its report with test evidence (for screens: browser screenshots and console errors). **No evidence → the orchestrator rejects the work and re-dispatches.** This single rule removes most "it's done!" hallucinations.
4. **The dogfood loop.** After the gate, the dogfood specialist uses the product like a real person and reports what's broken or confusing. Findings go back to the pm for the next round.
5. **Parallelisation rules.** Read-only work and writes to different files run in parallel. Writes to the same file, dependent work, and anything using the single shared browser run one at a time.

```
pm: criteria ──► builders (in parallel where safe) ──► QA gate ──► dogfood ──► findings ──► pm
                        ▲                                 │
                        └────── rejected: no evidence ◄───┘
```

### Your turn: write your roster

Open **[TEAM.md](../config-examples/orchestration/TEAM.md)**. It's this team as a reusable template, with a **non-software variant** (planner, parallel researchers, writer, fact-checker, critic, test reader). Adapt it to *your* work, save it in your vault, and add to your global instructions:

> When a task is big, read TEAM.md in my vault and act as the orchestrator.

Then give it a real, multi-part task and watch it plan, dispatch and gate.

---

## Running several agents side by side

Subagents run *inside* one session. Sometimes you'll want several **separate sessions** open at once: one per specialist, or one per project. Two problems appear: knowing which agent is waiting for you, and stopping agents from overwriting each other's files.

| Need | Tool |
|---|---|
| A few sessions, no setup | The Claude desktop app or Goose Desktop: open several sessions |
| See at a glance which agent is working, idle or waiting; keep sessions alive when you close the laptop | **[Herdr](https://herdr.dev)**, an agent-aware workspace manager for the terminal (Windows via WSL) |
| Each agent on its own copy of the project | **Git worktrees**, managed for you by **[Claude Squad](https://github.com/smtg-ai/claude-squad)**, **dmux** or **ccmanager** |
| A visual dashboard (Mac) | **[Conductor](https://conductor.build)** |
| Hand ECC's specialist agents to a team in one go | ECC's `team-builder` skill ([ECC guide](../guides/ecc.md)) |

Details and alternatives are in the [Toolbox](../TOOLBOX.md#3-running-several-agents-side-by-side). The same rules apply as in TEAM.md: never let two agents write to the same file at the same time.

---

## Check you got it

- [ ] I can explain why a subagent's fresh whiteboard improves quality.
- [ ] I can name the 5 orchestration patterns and pick one for a task.
- [ ] I ran a fan-out and found the reports in my vault.
- [ ] I fact-checked something an agent wrote.
- [ ] I can explain the QA gate and why it matters.
- [ ] I have a TEAM.md adapted to my own work.

## Pitfalls

- **Vague briefs.** Say what to return, how long, with what evidence, and where to save it.
- **Over-orchestrating.** Five agents for a two-minute task is slower and more expensive.
- **Accepting "done" without proof.** The gate is the whole point. "Looks good" is not a criterion.
- **Parallel writes to the same file.** They overwrite each other. Serialise.
- **Cost.** Each subagent uses its own tokens. Put simple roles on cheap models.

## How it connects

- Subagents **read and write the vault** (03), so the team shares one memory.
- A subagent can be given specific **skills** (04) and **connectors** (05).
- A team can run in a **loop** until a goal is met (07): that's how the case-study team worked through its backlog.

## Go deeper

- ⭐ [Anthropic — Building effective agents](https://www.anthropic.com/engineering/building-effective-agents)
- [Claude Code — subagents](https://code.claude.com/docs/en/sub-agents) · [Goose — subagents](https://goose-docs.ai/docs/guides/context-engineering/subagents)
- [VoltAgent — 100+ subagent roles](https://github.com/VoltAgent/awesome-claude-code-subagents) · [ECC](https://github.com/affaan-m/ECC)
