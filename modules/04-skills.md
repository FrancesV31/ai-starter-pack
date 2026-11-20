# 04 — Skills: teach it a workflow once

⏱ 20 min · [← Previous](03-persistent-memory.md) · [Next: Connectors →](05-connectors-mcp.md)

## Why it matters

You have workflows you repeat: "interview me about this idea", "turn these notes into a spec", "ingest this source". Typing the full instructions every time is slow and inconsistent. A **skill** saves a workflow once, so the agent does it the same good way every time.

## The concept

A skill is **a folder with a `SKILL.md` file**:

```
vault-ingest/
└── SKILL.md
```

```markdown
---
name: vault-ingest
description: Ingest new sources into the memory vault. Use when the user adds files to raw/ or inbox/, or says "ingest".
---

# Vault ingest
1. Read AGENTS.md at the vault root...
2. ...
```

- The part between the `---` lines is the **frontmatter**: a name and, most importantly, a **description** that says *when* to use the skill.
- Below it are the instructions, in plain English.
- The folder can also hold templates, examples or scripts the skill refers to.

### Why you can install dozens: progressive disclosure

The agent doesn't read every skill at the start. It reads **only the one-line descriptions** (a few dozen tokens each). When your request matches a description, *then* it loads the full instructions. So skills are cheap until they're used. That's why the description is the most important line you'll write.

### Two ways to use a skill

- **Automatically:** you say "ingest the new article" and the agent recognises the `vault-ingest` description.
- **On purpose:** you type `/vault-ingest` (Claude) or ask Goose to "use the vault-ingest skill".

### Write once, use everywhere

Skills are an **open standard** ([agentskills.io](https://agentskills.io)) used by Claude, Goose, Cursor, GitHub Copilot, OpenCode and others. Where they live:

| Agent | Global skills folder | Project skills folder |
|---|---|---|
| 🟣 Claude Code | `~/.claude/skills/<name>/SKILL.md` | `.claude/skills/<name>/` |
| 🪿 Goose | `~/.agents/skills/<name>/SKILL.md` | `.agents/skills/<name>/` |

👉 **Goose also reads `~/.claude/skills/`**, so if you put your skills there, both agents see them. That's what this pack's install script does.

## Set it up (10 min)

### 1. Install this pack's starter skills

From the pack folder, in PowerShell:

```powershell
.\setup\install-starter-skills.ps1
```

This copies eleven skills into `~/.claude/skills/`. It also copies the pack's subagents into `~/.claude/agents/`. It never overwrites anything you already have.

| Group | Skills | What they do |
|---|---|---|
| **Vault** (module 03) | `vault-ingest`, `vault-query`, `vault-lint`, `session-wrap` | Add sources, ask questions, health-check, save the session |
| **Verification** (module 06) | `fact-check` | Checks a document's claims against web sources, with the help of a subagent |
| **Thinking** | `shape` | Interviews you about a rough idea, one question at a time, then writes a one-page brief |
| | `critique` | Skeptical-investor review and pre-mortem of a plan, ending with the cheapest test to run this week |
| | `market` | Fast competitive scan with sources: players, gaps, signals, risks |
| | `prd` | Turns a brief into a product requirements document with user stories and success metrics |
| | `explain` | Explains anything with a plain definition, an example and an analogy |
| | `recap` | "Where are we?": goal, done, next |

The thinking skills come straight from the author's own setup ([MY-SETUP.md](../MY-SETUP.md)). They chain well: **`shape` → `critique` → `market` → `prd`** takes a shower thought to a spec in one sitting. Type `/shape my idea for…` to start.
*(On macOS, copy the folders from `skills/` into `~/.claude/skills/` and the files from `config-examples/subagents/` into `~/.claude/agents/` with Finder.)*

### 2. Install Matt Pocock's skills (recommended)

[mattpocock/skills](https://github.com/mattpocock/skills) is the best first library: small, sharp skills that make agents ask better questions and plan before acting. Favourites for non-developers:

| Skill | What it does |
|---|---|
| `grill-me` | Interviews you relentlessly about a plan until every open question is resolved |
| `to-spec` | Turns a conversation into a clear written spec |
| `to-tickets` | Breaks a plan into small, ordered tasks |
| `handoff` | Writes a handoff note so a new session (or a person) can pick up where you left off |
| `teach` | Teaches you a topic step by step instead of just giving the answer |

How to install them:
- 🟣 **Claude Code:** they're available as a plugin. Type `/plugin` in Claude Code, search for **mattpocock skills** and install. Then run `/setup-matt-pocock-skills` once per project, as the repo explains.
- 🪿 **Goose / any agent, no tools needed:** on the GitHub page click **Code → Download ZIP**, unzip it, and copy the skill folders you want into `~/.claude/skills/` (or `~/.agents/skills/`).
- **If you have Node.js:** `npx skills@latest add mattpocock/skills` installs them for the agents you choose.

> ⚠️ **Only install skills from sources you trust.** A skill is instructions your agent will follow, and a malicious one could tell it to do harmful things. Read a `SKILL.md` before installing it. It's just text.

## Try it (10 min)

1. Start a new session and ask: *"What skills do you have?"*
2. Run `grill-me` on a real idea: *"Grill me about my plan to <something you're actually considering>."* Answer its questions. Notice how much sharper the plan gets.
3. When done: *"Turn this into a spec with to-spec, and save it in my vault."*

### Write your own skill (the real lesson)

Think of a request you've typed three times. Then:

> Create a skill called `<name>` in ~/.claude/skills that does the following: <your workflow>. Write a description that says clearly when to use it.

Open the `SKILL.md` it created, read it, and adjust it. You've just taught your agent a permanent new ability.

### 3. Next library: ECC (pick, don't bulk-install)

[ECC](https://github.com/affaan-m/ECC) has 290+ skills: research, writing, business, product, memory, quality checks, orchestration. Installing all of them would flood your agent's whiteboard. Install a **selection** instead:

```powershell
.\setup\get-ecc-skills.ps1 -List        # browse every skill with its description
.\setup\get-ecc-skills.ps1              # install 8 recommended ones (council, product-lens, brand-voice…)
```

The [ECC guide](../guides/ecc.md) has a curated list of ~30 skills for non-developers, and the full-install options.

### A skill can hand off to a subagent

`fact-check` is only a few lines long: it packages your request and hands it to the `fact-checker` subagent, which does the heavy research on its own whiteboard. Try `/fact-check <a file or URL>` now, or wait for module 06, which explains the pattern.

## Check you got it

- [ ] I can explain why the description line matters most (progressive disclosure).
- [ ] `/vault-ingest` or "what skills do you have?" shows my skills.
- [ ] I've written one skill of my own.

## How it connects

- Skills package the **vault operations** (03) into one-word commands.
- **Subagents** (06) can be given specific skills.
- **Automation** (07) runs skills on a schedule: "run vault-lint every Monday".

## Go deeper

- ⭐ [Matt Pocock — skills](https://github.com/mattpocock/skills)
- [Anthropic — Equipping agents with Agent Skills](https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills)
- [Claude Code — skills docs](https://code.claude.com/docs/en/skills) · [Goose — skills docs](https://goose-docs.ai/docs/guides/context-engineering/using-skills)
- [ECC guide](../guides/ecc.md): the big library, used wisely
- [Toolbox: skill and subagent libraries](../TOOLBOX.md#5-skill-and-subagent-libraries), including Anthropic's official example skills
