# The author's setup — a real, working stack

The course teaches the ideas one at a time. This page shows **what one person actually runs every day**, after months of adding, keeping and removing tools. Use it as a reference, not a shopping list: the point is to see how the pieces work together, then copy only the layers you need.

Labels (same as the [Toolbox](TOOLBOX.md)): ✅ in daily use · 🧪 installed and tried, not part of the routine.

> The author is a product manager, not a developer. Everything below runs on one Windows 11 laptop with PowerShell, plus an Ubuntu installation inside Windows (WSL) for Linux-only tools.

---

## The stack at a glance

```
          ┌──────────── Claude Code (desktop app) ─── daily driver ────────────┐
 YOU ───► │  standing instructions · skills · plugins · connectors · subagents │
          └───────┬───────────────────────────────┬───────────────────────────┘
                  │ hands bigger builds to         │ reads & writes
                  ▼                                ▼
   Goose (orchestrator)  ──►  specialist      OBSIDIAN VAULT  (LLM Wiki)
   one model per role         agents          sources → wiki → index → log
                  │                                ▲
                  ▼                                │ every session ends with a wrap
   OpenClaw (dogfood tests)   OpenCode / Codex (second opinions)
                  │
   Herdr + OpenRig: see and steer all running agents
```

---

## 1. Agents (the "bodies")

| | Tool | Role in this setup |
|---|---|---|
| ✅ | **Claude Code**, in the Claude desktop app (Code tab) | The daily driver: research, writing, planning, code. Built-in browser pane, file panel, plugins |
| ✅ | **Goose** (desktop + CLI) | The **orchestrator** of a multi-model team (section 7). Chosen because it can give each specialist a different model and provider |
| ✅ | **OpenCode** (CLI + desktop) | Open-source second agent; shares the same skills folder |
| ✅ | **Codex CLI** | OpenAI's agent, used for second opinions and cross-checks |
| ✅ | **OpenClaw** | Open-source personal agent with strong browser automation; runs the "dogfood" tests that use the product like a real user |
| ✅ | **Zed** | Code editor with an agent panel, for reading code comfortably |
| ✅ | **Ollama** | Local models, for free and private experiments |
| 🧪 | Cline, GitHub Copilot | Tried inside editors; not needed once the terminal agents were in place |

**Lesson:** one daily driver plus one orchestrator is enough. The others are there to compare models or for a specific job.

## 2. Standing instructions

| | File | What's in it |
|---|---|---|
| ✅ | Global `~/.claude/CLAUDE.md` | Who I am (role, OS, level), how I like answers (plain English first, PowerShell commands, explain new jargon once), how to work (plan first, verify after changes), my goals |
| ✅ | `AGENTS.md` at the root of the workspace | What each project folder is, who the specialist agents are, the main commands. Read by Claude Code, Goose, OpenCode and Codex |
| ✅ | Global `.goosehints` | The same profile, for Goose |
| ✅ | Claude's automatic memory | Short facts Claude saves between sessions ("in project X, the user prefers compact screens") |

Template: [config-examples/global-instructions-template.md](config-examples/global-instructions-template.md). Module: [02](modules/02-standing-instructions.md).

## 3. Persistent memory

| | Tool | Role |
|---|---|---|
| ✅ | **Obsidian vault** built on Karpathy's LLM Wiki pattern | The single long-term memory for *all* projects: raw sources (never edited), AI-maintained wiki pages, `index.md`, `log.md`, session notes |
| ✅ | Obsidian plugins: **Dataview**, **Templater**, **Excalidraw**, **Obsidian Git** | Live tables over notes, note templates, hand-drawn diagrams, automatic backup |
| ✅ | Goose **Memory** and **Chat Recall** extensions | Goose's own small memory and search over past chats |
| 🧪 | SwarmVault | A CLI for agent knowledge vaults; tried, the plain-Markdown vault won |

The vault is split into **tiers**: active domains get a full wiki; occasional ones a light index; archives are just storage. Module: [03](modules/03-persistent-memory.md).

## 4. Skills (saved workflows)

| | Skills | Where they come from |
|---|---|---|
| ✅ | `vault-ingest`, `vault-query`, `vault-lint`, `session-wrap` | Written for the vault; shipped in this pack |
| ✅ | `fact-check` + the `fact-checker` subagent | Written to verify AI-generated documents; shipped in this pack |
| ✅ | **Thinking skills:** `shape`, `critique`, `market`, `prd`, `explain`, `recap` | Personal shortcuts for product work; shipped in this pack (module [04](modules/04-skills.md)) |
| ✅ | About 40 **Matt Pocock** skills (`grill-me`, `to-spec`, `handoff`, `triage`, `retro`, `wayfinder`, the writing skills…) | Installed in `~/.agents/skills`, so Goose, OpenCode and Codex share them |
| ✅ | **last30days** | "What did people say about X in the last 30 days?": trend research across social and web sources |
| ✅ | **find-skills** | Searches the skills.sh directory when a new need comes up |
| ✅ | Anthropic's document skills (Word, PowerPoint, Excel, PDF) | Built into the Claude apps |

## 5. Plugins (bundles of skills, agents, hooks and connectors)

| | Plugin | Why it's kept |
|---|---|---|
| ✅ | **ECC** (Everything Claude Code) | A large library; only a few skills are used daily, plus its safety hooks. See the [ECC guide](guides/ecc.md) |
| ✅ | **VoltAgent** business and research subagents | Ready-made specialists: product manager, market researcher, competitive analyst, UX researcher, legal advisor… |
| ✅ | Anthropic **Product management** and **Design** plugins | Specs, roadmaps, stakeholder updates, research synthesis, design critique, UX copy |
| ✅ | **Ralph loop** | Keeps the agent working on one task until a stated finish line (module [07](modules/07-automation.md)) |
| ✅ | PDF viewer | Read, annotate, fill and sign PDFs with the agent |

## 6. Connectors (MCP)

| | Connector | Used for |
|---|---|---|
| ✅ | Google Drive, Google Calendar | Find documents, prepare meetings |
| ✅ | **Context7** | Up-to-date documentation for any library or tool |
| ✅ | **Mobbin** | Real app screens and flows as design references |
| ✅ | **Claude in Chrome**, Chrome DevTools, computer use | Let the agent use a browser or desktop apps, with approval |
| ✅ | Scheduled tasks | Run a prompt on a schedule from the desktop app |
| ✅ *(available, authorised only when needed)* | Notion, Figma, Linear, Slack, Asana, Atlassian, Intercom (via the Design plugin); Amplitude, Pendo, Similarweb, Fireflies, ClickUp, Monday (via the PM plugin) | Plugins bring their connectors along. They stay **unauthorised until a task needs them**, which keeps the context window small (module [05](modules/05-connectors-mcp.md)) |
| ✅ | Goose built-in extensions: Developer, Computer Controller, Memory, Chat Recall, Auto Visualiser, Todo, Summon, Top Of Mind | Goose's own toolbox (module 05) |
| 🧪 | Serena, Desktop Commander | Code navigation and extended file/terminal control. Tried; Claude Code's built-in tools cover the need |

## 7. Subagents and orchestration

- ✅ **Named subagents** in Claude Code: the `fact-checker`, plus the VoltAgent specialists when a task fits one.
- ✅ **A real team in Goose**: an orchestrator plus `pm`, `backend`, `frontend`, `uiux`, `devops` and `dogfood` specialists, **each on a different model** (fast cheap models for structured work, stronger ones for what users will see, a multimodal one for screenshots). They share a culture file and pass a QA gate. Full description: module [06](modules/06-subagents-and-orchestration.md) and [TEAM.md](config-examples/orchestration/TEAM.md).
- ✅ **68 ECC personas ported to Goose**, so the same specialists work on any model.
- ✅ **Herdr**: one window showing every running agent and which one is waiting for an answer.
- ✅ **OpenRig**: a local control panel for multi-agent setups (who runs where, with which role).

## 8. Automation

| | What | How |
|---|---|---|
| ✅ | A sound when the agent finishes | Claude Code `Stop` hook |
| ✅ | "State the facts before you edit" guard | ECC's GateGuard hook |
| ✅ | Iterate until done | Ralph loop |
| ✅ | A written 6-phase improvement loop | Scan → plan → build → verify (max 3 retries) → human review → dogfood and reflect, with escalation gates |
| ✅ | Recurring jobs | Desktop-app scheduled tasks; Goose scheduler and recipes |
| 🧪 | cc-safety-net | A hook that blocks destructive commands; tried, GateGuard and permissions cover it |

Module: [07](modules/07-automation.md).

---

## How to copy this setup, in order

1. **Week 1:** one agent + standing instructions + the vault (modules 01–03). This alone gives most of the value.
2. **Week 2:** the starter skills, Matt Pocock's skills, and **one** connector you need (modules 04–05).
3. **Week 3:** the fact-checker and one named specialist (module 06), the finish sound and one loop (module 07).
4. **Later, only when you feel the pain:** an orchestrated team, Herdr/OpenRig, more plugins. Use the upgrade table at the end of the [Toolbox](TOOLBOX.md#11-a-suggested-upgrade-path).

**What was removed along the way** is as instructive as what stayed: extra editors, a second vault tool, overlapping safety hooks, and most of a 300-skill library. Every tool costs attention and tokens; keep the ones that earn their place.
