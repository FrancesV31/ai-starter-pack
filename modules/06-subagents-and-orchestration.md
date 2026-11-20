# 06 — ⭐ Subagents & orchestration: from one assistant to a team

⏱ 45 min · [← Previous](05-connectors-mcp.md) · [Next: Automation →](07-automation.md)

## Why it matters

Remember the whiteboard (module 00)? A big job like "research five competitors, compare them, and write a recommendation" fills it fast: every web page read, every dead end. By the time the agent writes the recommendation, its whiteboard is cluttered and the quality drops.

**Subagents** solve this the way a manager would: hand each piece to a helper with a **clean whiteboard and one job**, and get back only a short report.

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
       │Competitor│    │Competitor│    │Competitor│   own tools, one job
       │    A     │    │    B     │    │    C     │
       └────┬─────┘    └────┬─────┘    └────┬─────┘
            └── 1-page report ──┴── 1-page report ──┘
                          ▼
              Main agent compares and recommends
```

Three benefits:

1. **Clean context.** The main agent keeps only the conclusions, not the 40 web pages behind them.
2. **Specialisation.** Each helper can have its own instructions ("you are a sceptical reviewer"), its own tools (read-only, say), even a cheaper or stronger model.
3. **Parallelism.** Independent pieces run at the same time.

The trade-off: subagents **don't see your conversation**. They only know what the main agent tells them in the hand-off. A vague hand-off gives a vague result, so the quality of the brief matters.

### From subagents to orchestration

**Orchestration** is deciding *who does what, in what order, and how results are checked*. Five patterns cover almost everything (adapted from Anthropic's *Building effective agents*):

| Pattern | Shape | Use when | Example |
|---|---|---|---|
| **Fan-out / fan-in** | Split → many in parallel → combine | Independent pieces of the same kind | Research 5 competitors at once |
| **Pipeline** | A → B → C, each step's output feeds the next | Work with clear stages | Researcher → writer → editor |
| **Generator + critic** | One makes, one reviews, repeat until good | Quality matters more than speed | Draft a pitch → sceptical investor critiques → revise |
| **Router** | Look at the request, send it to the right specialist | Mixed incoming work | "Is this a research, writing or planning task?" |
| **Orchestrator + team** | A lead plans, dispatches to specialists, reviews against criteria | Bigger projects | A small product team: planner, builder, tester |

**Rule of thumb:** start with *one* agent. Add a subagent only when context gets cluttered or a job clearly splits. Every extra agent costs tokens and coordination.

### Memory makes teams work

Subagents forget everything when they finish, just like sessions. So **ask them to write their reports into the vault** (module 03), for example `domains/<topic>/wiki/research/competitor-a.md`. Then:

- the main agent reads short reports instead of raw research,
- you can review each report in Obsidian,
- and next week's session can build on them.

The vault becomes the team's **shared memory**.

## Set it up

### 🟣 Claude Code

**Built-in subagents** work right away. Just ask:

> Use subagents to research these three tools in parallel: X, Y, Z. Each should return a 10-line summary: pricing, strengths, weaknesses, sources.

**Custom subagents** are Markdown files with a role:

| Scope | Location |
|---|---|
| All your projects | `~/.claude/agents/<name>.md` |
| One project | `.claude/agents/<name>.md` |

```markdown
---
name: researcher
description: Researches a question on the web and writes a sourced brief. Use for any research task that needs several sources.
tools: Read, Write, Glob, Grep, WebSearch, WebFetch
---

You are a careful researcher. For the question you are given:
1. Search widely, prefer primary sources...
```

- `description` tells the main agent *when* to delegate to it (same idea as skills).
- `tools` limits what it can do. Leave it out to allow everything.
- Optional `model:` (`sonnet`, `opus`, `haiku`…) to run it on a cheaper or stronger model.

This pack includes three ready-made ones in [`config-examples/subagents/`](../config-examples/subagents/): **researcher**, **critic** and **note-keeper**. Copy them into `~/.claude/agents/`.

### 🪿 Goose

Subagents work **in plain language**, through the built-in *Summon* extension (enabled by default):

> Use 3 subagents in parallel to research X, Y and Z. Each returns a 10-line summary with sources.

Words like "in parallel" or "then" set the mode. Useful settings (environment variables): `GOOSE_MAX_CONCURRENT_SUBAGENTS` (default 5), and `GOOSE_SUBAGENT_MODEL` / `GOOSE_SUBAGENT_PROVIDER` to run helpers on a cheaper model.

For a **reusable specialist**, write a **recipe**: a YAML file with instructions and parameters ([`config-examples/goose-recipes/research-brief.yaml`](../config-examples/goose-recipes/research-brief.yaml)). Goose can run a recipe as a subagent: *"Use the research-brief recipe as a subagent for each of these three topics."*

> Note: subagents are turned off in Goose's manual-approval modes, and they can't start their own subagents.

## Try it (30 min) — your first agent team

**Exercise 1 — Fan-out (10 min).** Pick a real question with 3 independent parts (3 tools, 3 cities, 3 job offers…):

> Use 3 subagents in parallel, one per option: A, B, C. Each writes a brief to my vault at domains/example-domain/wiki/research/<option>.md with pros, cons and sources. Then compare them in a table and recommend one.

Open the three briefs in Obsidian. Notice the main session stayed short and focused.

**Exercise 2 — Generator + critic (10 min).** With the `critic` subagent installed (Claude) or in plain language (Goose):

> Draft a one-page proposal for <idea>. Then have the critic subagent tear it apart as a sceptical investor. Revise based on its critique. Show me both versions and what changed.

**Exercise 3 — Write your team roster (10 min).** Open [`config-examples/orchestration/TEAM.md`](../config-examples/orchestration/TEAM.md). It's a template for an orchestrator: which specialist handles what, and how work is checked. Adapt it to *your* work (a writer, a researcher, a fact-checker?). Put it in your vault, and point your instructions to it:

> When a task is big, read TEAM.md and dispatch to the right specialists.

## Check you got it

- [ ] I can explain why a subagent's fresh whiteboard improves quality.
- [ ] I can name the 5 orchestration patterns and pick one for a task.
- [ ] I ran a fan-out and found the reports in my vault.
- [ ] I know the main cost: a subagent only knows what I (or the main agent) tell it.

## Pitfalls

- **Vague hand-offs.** "Research X" gets a generic result. Say what to return, how long, with what sources, and where to save it.
- **Over-orchestrating.** Five agents for a two-minute task is slower and more expensive. Delegate only when it clearly helps.
- **Trusting without checking.** The orchestrator, which means you or the main agent, must review results against clear criteria. "Looks good" is not a criterion.
- **Cost.** Each subagent uses its own tokens. Run helpers on cheaper models when the task is simple.

## How it connects

- Subagents **read and write the vault** (03), so the team shares one memory.
- A subagent can **use skills** (04) and **connectors** (05).
- **Automation** (07) can launch an orchestrated job on a schedule: "every Monday, have the researcher scan news on X and brief me in my vault".

## Go deeper

- ⭐ [Anthropic — Building effective agents](https://www.anthropic.com/engineering/building-effective-agents): the orchestration patterns, explained properly.
- [Claude Code — subagents](https://code.claude.com/docs/en/sub-agents) · [Goose — subagents](https://goose-docs.ai/docs/guides/context-engineering/subagents)
- [VoltAgent — 100+ subagent roles](https://github.com/VoltAgent/awesome-claude-code-subagents): read a few to see how good roles are written.
