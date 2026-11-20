# ECC guide — the big library, used wisely

[← Back to README](../README.md) · Related: [module 04 — Skills](../modules/04-skills.md), [module 06 — Subagents](../modules/06-subagents-and-orchestration.md), [module 07 — Automation](../modules/07-automation.md)

## What ECC is

**[ECC](https://github.com/affaan-m/ECC)** (originally "Everything Claude Code") is the largest open-source toolbox for AI agents. It's MIT-licensed, maintained by Affaan Mustafa, and not made by Anthropic. Its idea, in its own words: *"Optimize the context window. Persist everything else."*

| Included | Count (release 2.2.3; the main branch keeps growing) | What it gives you |
|---|---|---|
| **Skills** | 293 (300+ on main) | Research, writing, business, product, memory, quality checks, orchestration, and lots of software engineering |
| **Agents** (subagents) | 68 | Planners, reviewers, architects, security, build fixers, domain specialists |
| **Commands** | 94 | `/ecc:<name>` shortcuts to the main workflows |
| **Hooks** | Profiles | Guards (GateGuard, safety-guard), session summaries, cost tracking, continuous learning |
| **Memory & learning** | Built in | Saves sessions, learns "instincts" from your corrections, promotes them into skills |
| **AgentShield** | Built in | Scans your agent setup for risky prompts, hooks, MCP config, permissions and secrets |

It works best with **Claude Code**, has a supported path for **Codex**, and offers more limited adapters for Cursor, OpenCode, Gemini, Zed, GitHub Copilot and others.

## ⚠️ The trap: don't load everything

Remember module 05: everything installed adds descriptions to the whiteboard, and hooks add steps. Installing the whole bundle on day one makes your agent **slower, more expensive and more distracted**. Start with **5–10 skills you'll actually use**, then grow.

ECC has tools to help you trim it:
- **`agent-sort`**: sorts ECC's skills into "daily" vs "library" for *your* project.
- **`skill-stocktake`**: audits your installed skills for quality and overlap.
- **`context-budget`**: shows which skills, agents, MCP servers and rules eat your context, with savings suggestions.

## Three ways to install

### Option A — only the skills you choose (recommended to start, any agent)

This pack includes a script that downloads ECC from its official GitHub page and copies **only the skills you name** into `~/.claude/skills/` (read by Claude Code and Goose). No Git or Node.js needed. It adds ECC's licence file to each skill and never overwrites existing ones.

```powershell
# See every available skill with its description
.\setup\get-ecc-skills.ps1 -List

# Install the recommended starter set (see "Curated selection" below)
.\setup\get-ecc-skills.ps1

# Or pick your own
.\setup\get-ecc-skills.ps1 -Skills council, product-lens, article-writing
```

Limit: skills that rely on ECC's hooks, commands or paid search services (noted below) won't work fully this way.

### Option B — the Claude Code plugin (full ECC)

Inside Claude Code:
```
/plugin marketplace add https://github.com/affaan-m/ECC
/plugin install ecc@ecc
```
Then start a new session and type `/plugin list` to check it's enabled. ECC skills are then available as `ecc:<skill-name>`, and commands as `/ecc:<command>`.

### Option C — the guided installer (full ECC, chooses hooks for you)

Needs Node.js 18+, Git and Claude Code. In PowerShell:
```powershell
npx ecc-universal@2.2.3 setup
```
*What this is: `npx` downloads and runs a package once without installing it permanently.* For a personal setup choose **Global user** and **Standard** hooks. Rerun the same command later to update ECC or change the hook profile. To set up several agents at once (Claude Code, Codex, Kimi Code): `npx ecc-universal@2.2.3 install --guided`.

> 🔒 **Install only from the official repository** (`github.com/affaan-m/ECC`, package `ecc-universal`). ECC warns that third-party re-uploads and mirrors are not reviewed and may contain malware.

## Curated selection for non-developers

About 30 skills worth knowing, grouped by what you're trying to do. ⭐ = in the starter set installed by `get-ecc-skills.ps1` with no arguments.

### Research and thinking

| Skill | What it does |
|---|---|
| ⭐ `market-research` | Market sizing, competitor comparisons, due diligence, with sources and a decision-oriented summary |
| `deep-research` | Multi-source research report with citations and confidence levels. *Needs the Firecrawl and Exa search connectors* |
| `research-ops` | Evidence-first "what's true right now" research and recommendations |
| ⭐ `council` | Convenes four voices that disagree on purpose, for go/no-go calls and trade-offs |
| ⭐ `search-first` | Before building anything, searches for existing tools, skills and connectors that already do it |

### Writing and content

| Skill | What it does |
|---|---|
| ⭐ `article-writing` | Long-form articles, guides and newsletters in a voice learned from your examples |
| ⭐ `brand-voice` | Builds a style profile from your real writing, then reuses it everywhere: no generic AI tone |
| `content-engine` | Turns one piece into native posts for LinkedIn, X, newsletters, video scripts, plus a content calendar |
| `crosspost` | Adapts one message per platform; never posts identical text everywhere |
| `frontend-slides` | Builds polished, animated HTML presentations, or converts PowerPoint files |

### Business and product

| Skill | What it does |
|---|---|
| ⭐ `product-lens` | "Validate the why before building": product diagnostic with a go/no-go, user-journey audit, ICE prioritisation |
| `product-capability` | Turns a PRD or roadmap ask into a concrete plan with constraints and open decisions |
| `investor-materials` | Pitch decks, one-pagers, memos, financial models that stay consistent with each other |
| `investor-outreach` | Cold emails, intro blurbs, follow-ups and investor updates |
| `competitive-report-structure` | Turns competitor research into a board-ready competitive report |
| `lead-intelligence` | Finds and qualifies contacts and drafts personalised outreach |

### Memory and learning (pairs with module 03)

| Skill | What it does |
|---|---|
| `knowledge-ops` | Organise, sync, de-duplicate and search across your knowledge stores |
| `unified-memory` | Shares context and hand-offs between different agents (Claude, Codex, Cursor, OpenCode…) |
| `continuous-learning-v2` | Watches your sessions, learns "instincts" from your corrections, and promotes the good ones into skills. *Uses ECC hooks* |
| `/ecc:save-session` · `/ecc:resume-session` | Save where you are, pick it up in a later session (commands) |
| `/ecc:learn` | Extracts reusable patterns from a session into a candidate skill (command) |

### Context and cost (pairs with module 05)

| Skill | What it does |
|---|---|
| ⭐ `context-budget` | Audits what's eating your context window and suggests what to remove |
| `strategic-compact` | Suggests summarising the session at natural break points, instead of letting it fill up |
| `token-budget-advisor` | Offers a short / medium / full answer, with token estimates, before replying |
| `cost-tracking` · `/ecc:cost-report` | Spending by model, session and date. *Uses ECC's cost-tracker hook* |

### Quality and verification (pairs with the fact-checker, module 06)

| Skill | What it does |
|---|---|
| ⭐ `santa-method` | Two independent reviewers with the same checklist must both approve before anything ships, with a fix-and-re-review loop |
| `verification-loop` | A full PASS/FAIL check of an agent's work before you accept it (mostly for software) |
| `prompt-optimizer` | Diagnoses a prompt you wrote and returns an improved, ready-to-paste version |

### Orchestration and automation (pairs with modules 06 and 07)

| Skill | What it does |
|---|---|
| `team-builder` | Lets you pick up to five specialist agents, runs them in parallel on one task, and merges where they agree and disagree |
| `blueprint` | Turns a one-line goal into a multi-session, multi-agent plan with briefs and a review gate |
| `plan-orchestrate` | Splits a written plan into steps and designs an agent chain for each |
| `continuous-agent-loop` | Patterns for long-running loops with quality gates and recovery |
| `dmux-workflows` | Running several agents in parallel terminal panes (see the [Toolbox](../TOOLBOX.md#3-running-several-agents-side-by-side)) |
| `agentic-os` | Building a persistent multi-agent "operating system" on Claude Code: memory, commands, scheduling |

### Safety (pairs with module 07)

| Skill | What it does |
|---|---|
| `gateguard` | The guard hook from module 07: the agent must state facts before its first edit or command |
| `safety-guard` | "Careful" mode confirms dangerous commands; "Freeze" locks writes to one folder |

## ECC beyond Claude: a case study

ECC's 68 agents are Markdown role files, so they can be **adapted to other agents**. The team from module 06 did exactly this: the personas were ported into a Claude-free library for **Goose**, each with clean frontmatter (`name`, `description`, a recommended model) and a note explaining the adaptation. The orchestrator calls them on demand (an architect for structure questions, a code reviewer for adversarial review, a security reviewer before release) alongside the six core specialists.

How to do the same:
1. Download ECC (Option A's script uses the same download), open its `agents/` folder, and pick 3–5 roles you need.
2. Copy each into your vault (e.g. `team/architect.md`). Remove Claude-specific tool names and add a line saying which model to use.
3. List them in your [TEAM.md](../config-examples/orchestration/TEAM.md) under "on-demand library".
4. Dispatch: *"Use a subagent with the instructions in team/architect.md to review this plan."*

## Living with GateGuard and other hooks

If you install ECC's hooks (Option C, Standard profile), you'll meet **GateGuard**: before the agent creates or edits a file, or runs its first command, it must state facts (what you asked, which files depend on this one, what data it touches), then retry. It improves quality, at the cost of speed and tokens.

- To exempt folders where it only adds friction (notes, docs), set the environment variable `GATEGUARD_EXEMPT_GLOBS`, e.g. `**/docs/**,**/my-vault/**`, in your Claude Code `settings.json` under `"env"`.
- To turn it off for a session: `ECC_GATEGUARD=off`.
- To disable one hook by name: list it in `ECC_DISABLED_HOOKS`.

## Go deeper

- [ECC on GitHub](https://github.com/affaan-m/ECC): README, support matrix, full catalogue
- Inside Claude Code with ECC installed: ask *"Use ecc-guide: which ECC skill fits <my task>?"*, which answers from ECC's live files instead of memory
