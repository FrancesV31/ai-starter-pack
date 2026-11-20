# Toolbox — what's out there, organised by need

The course uses Claude Code or Goose, Obsidian, and a few skills. This page is the **wider map**: agents, terminals, multi-agent tools, memory, skills, connectors, browser control, automation, models and everyday helpers.

**How to use it:** find the section that matches a need you *actually have*, read its "which one?" line, and add **one** tool. Come back when the next need shows up. Every tool you add costs attention, and often tokens.

**Labels**
- ✅ **in the author's setup**: used every day. See [MY-SETUP.md](MY-SETUP.md) for how it all fits together.
- 🧪 **tried**: installed and tested, not part of the routine.
- ➕ **worth adding**: popular or well regarded, not in the author's setup. Try it if it fits your need.

Other marks: 🆓 free / open source · 💳 paid (often with a free tier) · 🧑‍💻 more technical · 🪟 Windows · 🍎 macOS

> Tools in this space change monthly. Names, prices and features were checked in November 2026. Always install from the official site linked here.

| I want… | Go to |
|---|---|
| …an agent to work with | [1. Agents](#1-agents-harnesses) |
| …a nicer terminal window | [2. Terminals](#2-terminals-a-nicer-window) |
| …several agents running at once | [3. Several agents](#3-running-several-agents-side-by-side) |
| …my agent to remember | [4. Memory](#4-memory-add-ons-around-your-obsidian-vault) |
| …ready-made workflows | [5. Skills and plugins](#5-skill-and-subagent-libraries) |
| …my agent to talk to my apps | [6. Connectors](#6-connectors-mcp-by-category) |
| …my agent to use a browser or my computer | [7. Browser and computer](#7-browser-and-computer-control) |
| …things to run without me | [8. Automation](#8-automation-without-you-pressing-the-button) |
| …other or cheaper models | [9. Models](#9-models-and-providers) |
| …to talk instead of type, track costs, stay safe | [10. Everyday helpers](#10-everyday-helpers) |

---

## 1. Agents (harnesses)

*Reminder: the harness is the "body" around the model (module 00). All of these can read and write files and use tools; they differ in where they run, which models they accept, and how you talk to them.*

### No terminal needed (best for non-developers)

| | Tool | What it is | Models | Cost |
|---|---|---|---|---|
| ✅ | **[Claude desktop app, Code tab](https://claude.ai/download)** | Claude Code in a window, with a file panel and a built-in browser | Claude | 💳 Pro/Max |
| ➕ | **[Claude Cowork](https://claude.com/blog/cowork-research-preview)** | Claude's desktop agent for everyday work: you pick a folder, and it reads, organises and writes files through chat | Claude | 💳 Paid Claude plans |
| ✅ | **[Goose Desktop](https://goose-docs.ai)** | The Goose agent in a window, with extensions, recipes and a scheduler | Any | 🆓 + your model provider |
| ✅ | **[OpenCode desktop](https://opencode.ai)** | The OpenCode agent in a window | Any | 🆓 + your provider |
| ➕ | **[ChatGPT agent](https://openai.com/index/introducing-chatgpt-agent/)** | ChatGPT's agent mode: browses, fills forms, builds files in its own virtual computer | OpenAI | 💳 ChatGPT plans |
| ➕ | **[Manus](https://manus.im)** | A general-purpose cloud agent with its own virtual computer: you describe a task, it researches, builds and reports back | Its own | 💳 free tier |

### Personal, always-on agents (you message them like a contact)

A newer category: an agent that **runs all the time** on your computer or a small server, remembers you across conversations, and that you reach from **Telegram, WhatsApp, Slack, email…** instead of a terminal. Powerful, but they hold a lot of access, so read their security pages first.

| | Tool | What it is | Cost |
|---|---|---|---|
| ✅ | **[OpenClaw](https://github.com/openclaw/openclaw)** | Very popular open-source personal agent: many chat channels, strong browser automation, plugins, scheduled jobs. In the author's setup it runs automated "dogfood" tests (module 06) | 🆓 🧑‍💻 + your model provider |
| ➕ | **[Hermes Agent](https://hermes-agent.nousresearch.com)** (Nous Research) | Open-source personal agent known for **learning as it works**: it keeps a memory of you (`MEMORY.md`, `USER.md`), searches past sessions, and **writes its own skills** after solving hard problems (same open skill format as this course). CLI, desktop app and messaging gateway. Windows: `iex (irm https://hermes-agent.nousresearch.com/install.ps1)` (native Windows is early beta; WSL also works) | 🆓 🧑‍💻 + your model provider (or Nous's paid portal) |

**Which one?** Both have a learning curve. Pick **Hermes** if you want an assistant that grows its own skills and memory; **OpenClaw** if you want the widest set of channels and browser automation. Both overlap with what you build in this course (memory vault + skills): try one only once modules 01–04 feel natural.

### In the terminal

| | Tool | Why you'd pick it | Models | Cost |
|---|---|---|---|---|
| ✅ | **[Claude Code](https://code.claude.com/docs/en/overview)** | The most capable agent loop; skills, subagents, hooks, plugins | Claude | 💳 |
| ✅ | **[Goose CLI](https://goose-docs.ai)** | Any model, recipes, scheduler, subagents; open source (Agentic AI Foundation) | Any | 🆓 |
| ✅ | **[OpenCode](https://opencode.ai)** | The closest open-source equivalent to Claude Code, 75+ providers, "plan" (read-only) vs "build" modes | Any | 🆓 |
| ✅ | **[Codex CLI](https://github.com/openai/codex)** | OpenAI's agent; strong sandboxing (OS-level limits on what it can touch); reads `AGENTS.md` | OpenAI (+ local via Ollama) | 🆓 CLI, included with ChatGPT plans |
| ➕ | **[Gemini CLI](https://github.com/google-gemini/gemini-cli)** | Google's open-source agent, very large context window | Gemini | 🆓 CLI; check Google's current pricing for usage |
| ➕ | **[Kilo Code](https://kilo.ai)** | Open-source agent for the terminal and VS Code (successor of Roo Code) | Any | 🆓 + models billed separately |
| ➕ | **[Aider](https://aider.chat)** | Lightweight pair-programmer: every edit is a Git commit, so nothing is lost | Any | 🆓 🧑‍💻 |
| ➕ | **[Qwen Code](https://github.com/QwenLM/qwen-code)** | Open-source agent tuned for Qwen models (cheap, capable open models) | Qwen + others | 🆓 🧑‍💻 |

### Inside a code editor

| | Tool | What it is | Cost |
|---|---|---|---|
| ✅ | **[Zed](https://zed.dev)** | Very fast editor with a built-in agent panel | 🆓 editor |
| 🧪 | **[Cline](https://cline.bot)** | Open-source agent extension for VS Code/JetBrains; asks approval for every step, with visual diffs | 🆓 + your provider |
| 🧪 | **[GitHub Copilot](https://github.com/features/copilot)** | Built into VS Code, with an agent mode | 💳 free tier |
| ➕ | **[Cursor](https://cursor.com)** | AI-first code editor (VS Code-based) with an agent mode | 💳 free tier |
| ➕ | **[Windsurf](https://windsurf.com)** | AI-first editor with an agent ("Cascade") | 💳 free tier |
| ➕ | **[Kiro](https://kiro.dev)** | Amazon's agentic editor, built around writing a spec before the code | 💳 free tier |
| ➕ | **[Antigravity](https://antigravity.google)** | Google's agent-first editor, where agents work in parallel and report with screenshots | 🆓 preview |

### In the cloud (you hand off a task and review the result)

| | Tool | What it is | Cost |
|---|---|---|---|
| ➕ | **[Replit Agent](https://replit.com/products/agent)** | Builds and hosts small web apps from a description, with nothing to install. Popular with non-developers for prototypes | 💳 free tier |
| ➕ | **[Devin](https://devin.ai)** | Autonomous software engineer that works in its own cloud machine and reports back | 💳 |
| ➕ | **[OpenHands](https://github.com/OpenHands/OpenHands)** | Open-source autonomous agent you can self-host | 🆓 🧑‍💻 |

**Which one?** Non-developer, already paying for Claude: the **desktop app** or **Cowork**. Want any model, or to pay nothing for the app: **Goose Desktop**. Comfortable in the terminal and want an open-source Claude Code: **OpenCode**. You live in ChatGPT: **Codex** or **ChatGPT agent**. Want an assistant you text from your phone: **Hermes** or **OpenClaw** (later).

> 💡 **Your setup travels with you.** `AGENTS.md`, skills (`SKILL.md`) and MCP servers are open standards. Most of the tools above read them, so your vault, instructions and skills keep working when you switch.

---

## 2. Terminals: a nicer window

| | Tool | What it is | Cost |
|---|---|---|---|
| ✅ | **[Windows Terminal](https://aka.ms/terminal)** 🪟 | Microsoft's modern terminal: tabs, split panes, themes. Pin it to your taskbar; it replaces the old PowerShell window | 🆓 |
| ✅ | **[WSL](https://learn.microsoft.com/windows/wsl/install)** 🪟 | Runs Linux inside Windows (`wsl --install`). Many agent tools are Linux/macOS-first; WSL makes them work on Windows | 🆓 🧑‍💻 |
| ➕ | **[WezTerm](https://wezterm.org)** 🪟🍎 | Fast, highly configurable terminal | 🆓 |
| ➕ | **[Ghostty](https://ghostty.org)** 🍎 | Fast, native terminal for macOS and Linux | 🆓 |
| ➕ | **[Warp](https://www.warp.dev)** 🪟🍎 | Terminal with built-in AI and a friendlier, editor-like input | 💳 free tier |

**Which one?** Windows: **Windows Terminal** (and WSL once you need Linux tools). Mac: the built-in Terminal is fine; **Ghostty** if you want faster and prettier.

---

## 3. Running several agents side by side

Once you use subagents and teams (module 06), you'll want **several agent sessions open at once**: one researching, one writing, one testing. Two problems appear: keeping track of which agent needs you, and stopping agents from overwriting each other's files.

Three concepts, in plain English:
- **TUI (text user interface):** a menu-style app that runs inside the terminal, with panels and shortcuts instead of plain text.
- **Multiplexer:** one terminal window split into many sessions that **keep running in the background**, even if you close the window or the laptop lid.
- **Git worktree:** a second copy of the same project folder, managed by Git, so two agents can work on the same project without touching the same files.

| | Tool | What it does | Platforms | Cost |
|---|---|---|---|---|
| ✅ | **[Herdr](https://herdr.dev)** | A workspace manager **built for AI agents**: groups each project's sessions, shows in a sidebar which agent is working, idle or waiting for you, and keeps sessions alive (including on remote servers). Recognises Claude Code, Codex and other agents automatically | macOS, Linux, Windows | 🆓 |
| ✅ | **[OpenRig](https://openrig.dev)** | A local **control plane** for multi-agent setups: describe a "rig" (which agents, which roles, which harness) and launch, watch and stop it as one unit, with transcripts | Cross-platform (needs Node.js) | 🆓 🧑‍💻 |
| ➕ | **[tmux](https://github.com/tmux/tmux/wiki)** | The classic multiplexer. Everything else builds on its ideas | macOS, Linux, WSL | 🆓 🧑‍💻 |
| ➕ | **[Zellij](https://zellij.dev)** | A friendlier modern multiplexer, with on-screen shortcut hints | macOS, Linux, WSL | 🆓 |
| ➕ | **[Claude Squad](https://github.com/smtg-ai/claude-squad)** | A TUI that runs several agents (Claude Code, Codex, Aider…), each in its own worktree, and lets you switch between them | macOS, Linux, WSL | 🆓 🧑‍💻 |
| ➕ | **[dmux](https://github.com/standardagents/dmux)** | Minimal tool: one tmux pane plus one worktree per agent | macOS, Linux, WSL | 🆓 🧑‍💻 |
| ➕ | **[ccmanager](https://github.com/kbwo/ccmanager)** | A TUI to list, start, stop and switch between agent sessions, with worktree support | macOS, Linux, WSL | 🆓 🧑‍💻 |
| ➕ | **[Conductor](https://conductor.build)** | A Mac app: one workspace per task, running Claude Code, Codex and others in parallel | 🍎 | 💳 |
| ➕ | **[Vibe Kanban](https://www.vibekanban.com)** | A kanban board where each card is a task handed to an agent | Cross-platform | 🆓 |

**Which one?** Start with what you have: Claude Code can already run subagents in parallel, and the Claude desktop app and Goose Desktop let you open several sessions. When you regularly run 3+ long sessions, try **Herdr** (agent-aware, survives a closed laptop). When you run a *team* with fixed roles, **OpenRig** lets you start and stop it as one unit. On a Mac, **Conductor** is the most visual option.

> ⚠️ Worktrees keep files apart, but they're **not a security boundary**: every agent still runs with your permissions on your computer.

---

## 4. Memory add-ons (around your Obsidian vault)

| | Tool | What it adds | Cost |
|---|---|---|---|
| ✅ | **[Obsidian](https://obsidian.md)** | The vault itself: plain Markdown files, links, graph (module 03) | 🆓 |
| ✅ | **[Obsidian Git](https://github.com/Vinzent03/obsidian-git)** (plugin) | Automatic backups of your vault to a private Git repository | 🆓 |
| ✅ | **[Dataview](https://github.com/blacksmithgu/obsidian-dataview)** (plugin) | Live tables and lists built from your notes ("all sources ingested this month") | 🆓 |
| ✅ | **[Templater](https://github.com/SilentVoid13/Templater)** (plugin) | Note templates with automatic dates and fields (session notes, source summaries) | 🆓 |
| ✅ | **[Excalidraw](https://github.com/zsviczian/obsidian-excalidraw-plugin)** (plugin) | Hand-drawn style diagrams inside the vault | 🆓 |
| ✅ | Goose **Memory** and **Chat Recall** extensions | Goose remembers small facts and can search your past Goose conversations | 🆓 |
| ✅ | Claude's **automatic memory** | Claude Code saves short facts between sessions; you can read and edit them | Included |
| 🧪 | **[SwarmVault](https://www.swarmvault.ai)** | A CLI for building agent knowledge vaults | 🆓 🧑‍💻 |
| ➕ | **[Smart Connections](https://github.com/brianpetro/obsidian-smart-connections)** (plugin) | Finds related notes by meaning, not just keywords, using a local model with no API key | 🆓 |
| ➕ | **[Copilot for Obsidian](https://github.com/logancyang/obsidian-copilot)** (plugin) | Chat with your vault from inside Obsidian | 🆓 / 💳 |
| ➕ | **[MCP Tools](https://github.com/jacksteamdev/obsidian-mcp-tools)** (plugin) | Lets Claude Desktop and other MCP apps read and search your vault | 🆓 |
| ➕ | **[NotebookLM](https://notebooklm.google)** | Google's "chat with your sources" notebook: answers only from the documents you upload, with citations. A no-install way to feel the "raw sources" idea | 🆓 |
| ➕ | **[Syncthing](https://syncthing.net)** | Syncs folders between your own devices, with no cloud | 🆓 |
| ➕ | **[Obsidian Sync](https://obsidian.md/sync)** | Obsidian's official encrypted sync | 💳 |

**Which one?** Backup first: **Obsidian Git** or **Obsidian Sync**. Then **Templater** for consistent notes. If your vault grows large, **Smart Connections**. Don't run several AI plugins at once: each builds its own index of the same notes.

---

## 5. Skill and subagent libraries

### Libraries

| | Library | What's in it | Start with |
|---|---|---|---|
| ✅ | **This pack's skills** | Vault operations, `fact-check`, and six thinking skills (`shape`, `critique`, `market`, `prd`, `explain`, `recap`) | Module 04 |
| ✅ | **[Matt Pocock — skills](https://github.com/mattpocock/skills)** | Small, sharp skills for planning and working well | `grill-me`, `to-spec`, `handoff`, `triage`, `retro` |
| ✅ | **[ECC](https://github.com/affaan-m/ECC)** | 68 agents, 300+ skills, hooks, memory, security scanning | Read the **[ECC guide](guides/ecc.md)** first |
| ✅ | **[VoltAgent — subagents](https://github.com/VoltAgent/awesome-claude-code-subagents)** | 100+ subagent roles: business, research, product, engineering | Business and research packs |
| ✅ | **[last30days](https://github.com/mvanhorn/last30days-skill)** | One deep skill: what people said about a topic in the last 30 days, across social and web sources | `/last30days <topic>` |
| ✅ | **[skills.sh](https://skills.sh)** + the `find-skills` skill | A searchable directory of community skills; `find-skills` lets your agent search it for you | Ask: "find a skill for…" |
| ✅ | **[Anthropic — skills](https://github.com/anthropics/skills)** | Official skills: Word, PowerPoint, Excel, PDF, design, and a skill for writing skills | `skill-creator` |
| ➕ | **[Agent Skills standard](https://agentskills.io)** | The open spec, plus the list of tools that support it | — |

### Plugins (bundles of skills + agents + connectors, 🟣 Claude)

| | Plugin | What you get |
|---|---|---|
| ✅ | **[Anthropic knowledge-work plugins](https://github.com/anthropics/knowledge-work-plugins)**: Product management, Design (and others: marketing, sales, finance, legal…) | Role-specific skills (`write-spec`, `roadmap-update`, `design-critique`, `ux-copy`…) plus that role's usual connectors |
| ✅ | **ECC**, **VoltAgent**, **Ralph loop**, **PDF viewer** | See above, module 07, and the [ECC guide](guides/ecc.md) |
| ➕ | Browse more | Type `/plugin` in Claude Code, or visit https://claude.com/connectors |

**Which one?** Start with this pack's skills and **Matt Pocock**. If you're a product person, add the **Product management** plugin. Add **ECC** only through the guide, a few skills at a time.

---

## 6. Connectors (MCP), by category

Module 05 explains what connectors are and **why each one costs context**. Add them one at a time, and remove the ones you don't use. "On demand" means the connector comes with a plugin and stays unauthorised until a task needs it.

| Category | | Connector | Notes |
|---|---|---|---|
| **Files & docs** | ✅ | **Google Drive** | Search and read documents |
| | ✅ on demand | **Notion**, **Atlassian** (Confluence, Jira) | Come with the Design plugin |
| | ➕ | OneDrive / SharePoint, Dropbox, Box | Official connectors in the Claude directory |
| **Calendar & meetings** | ✅ | **Google Calendar** | Availability, meeting prep |
| | ✅ on demand | **Fireflies** | Meeting transcripts (PM plugin) |
| **Communication** | ✅ on demand | **Slack**, **Intercom** | Read threads, prepare replies (never let it send without you) |
| | ➕ | Gmail, Outlook, Microsoft Teams | Official connectors |
| **Project tools** | ✅ on demand | **Linear**, **Asana**, **ClickUp**, **Monday** | Tickets and tasks (PM and Design plugins) |
| **Design** | ✅ | **[Mobbin](https://mobbin.com)** | Real app screens and user flows as references |
| | ✅ on demand | **Figma** | Read design files |
| **Product analytics & market** | ✅ on demand | **Amplitude**, **Pendo**, **Similarweb** | Product usage and web traffic data (PM plugin) |
| **Web research** | ➕ | **[Exa](https://exa.ai)**, **[Firecrawl](https://www.firecrawl.dev)**, **[Perplexity](https://www.perplexity.ai)** | Better web search and page extraction than built-in search, for deep research |
| **Docs for tools & code** | ✅ | **[Context7](https://context7.com)** | Up-to-date documentation for any library, so the agent doesn't rely on old training data |
| | 🧪 | **[Serena](https://github.com/oraios/serena)** | Helps an agent navigate large codebases by symbol |
| **Your computer** | 🧪 | **[Desktop Commander](https://github.com/wonderwhy-er/DesktopCommanderMCP)** | Gives Claude Desktop terminal and file control (Claude Code already has this built in) |
| | ✅ | **Scheduled tasks** (Claude desktop app) | Run a prompt on a schedule |
| **Monitoring** | ➕ | Datadog, Sentry | For product teams with production systems |
| **Automation hubs** | ➕ | **[Zapier MCP](https://zapier.com/mcp)** | One connector that reaches thousands of apps through your Zapier account |

### Goose's built-in extensions (🪿, no install needed)

| | Extension | What it does |
|---|---|---|
| ✅ | **Developer** | Files and shell commands (the basics) |
| ✅ | **Computer Controller** | Web scraping, file automation, controlling desktop apps |
| ✅ | **Memory** / **Chat Recall** | Remember facts / search past conversations |
| ✅ | **Auto Visualiser** | Turns data in the conversation into charts and diagrams |
| ✅ | **Todo** | A task list the agent keeps during long jobs |
| ✅ | **Summon** | Subagents and skills (module 06) |
| ✅ | **Top Of Mind** | Injects a fixed reminder into every turn (module 07) |

**Which one?** The connector for the place your work already lives (Drive, Notion, or your calendar), plus **Context7** if you work with any software tool.

---

## 7. Browser and computer control

| | Tool | What it does |
|---|---|---|
| ✅ | **[Claude in Chrome](https://claude.com/chrome)** | Claude acts in your own Chrome browser: reads pages, fills forms, tests your site |
| ✅ | **Built-in browser** (Claude desktop app) | A separate browser pane the agent uses, isolated from your own browser |
| ✅ | **Computer use** (Claude desktop app) | Claude takes screenshots and clicks in desktop apps, after you approve each app |
| ✅ | **[Chrome DevTools MCP](https://github.com/ChromeDevTools/chrome-devtools-mcp)** | Gives any MCP agent a controllable Chrome: screenshots, console errors, performance |
| ✅ | **[OpenClaw](https://github.com/openclaw/openclaw)** 🧑‍💻 | Browser automation used for automated "dogfood" testing (module 06) |
| ➕ | **[Playwright MCP](https://github.com/microsoft/playwright-mcp)** | Browser automation for any MCP agent, widely used for testing |

> ⚠️ An agent in your browser can see whatever you're logged into. Keep it to the sites the task needs, and never let it enter passwords or payment details.

---

## 8. Automation (without you pressing the button)

| | Tool | What it does |
|---|---|---|
| ✅ | **Hooks** (Claude Code) | "When X happens, do Y": a sound on finish, a guard before edits (module 07) |
| ✅ | **[Ralph loop](https://github.com/anthropics/claude-plugins-official)** (Claude Code plugin) | Keeps iterating on one task until a stated finish line |
| ✅ | **Scheduled tasks** (Claude desktop app) | A prompt that runs every morning, every Monday… |
| ✅ | **Goose recipes + scheduler** | Saved workflows you can run on a schedule (`goose schedule add`) |
| ✅ | **Windows Task Scheduler** / cron | Run any headless agent command at fixed times |
| ➕ | **[n8n](https://n8n.io)** | Visual workflow builder with AI agent steps; open source, can be self-hosted |
| ➕ | **[Zapier](https://zapier.com)** / **[Make](https://www.make.com)** | No-code automations between apps, now with AI steps and MCP |

**Which one?** Inside your agent first (hooks, loops, scheduled tasks). Reach for **n8n** or **Zapier** when the trigger lives *outside* the agent ("when a form is submitted…", "when an email arrives…").

---

## 9. Models and providers

| | Tool | What it is | Cost |
|---|---|---|---|
| ✅ | **[Ollama](https://ollama.com)** | Runs open models **locally on your computer**: free and private | 🆓 |
| ➕ | **[OpenRouter](https://openrouter.ai)** | One account and one API key for hundreds of models from every provider. Great with Goose or OpenCode to try models cheaply | 💳 pay per use |
| ➕ | **[LM Studio](https://lmstudio.ai)** | A desktop app to download and run local models, with a friendly interface | 🆓 |

**Choosing a model per role** (see the team in module 06): a fast, cheap model for reading and structuring; a strong model for the work people will see (writing, design, code); a multimodal model when it must look at images or screenshots. The author's Goose team mixes DeepSeek, Qwen, GLM and Gemma models this way.

---

## 10. Everyday helpers

### Talk instead of type
Explaining context by voice is 3–4× faster than typing it, and agents love context.

| | Tool | Platforms | Cost |
|---|---|---|---|
| ➕ | **Built-in voice mode** in Claude Code (`/voice`) and the Claude apps | All | Included |
| ➕ | **[Handy](https://handy.computer)** | 🪟🍎 + Linux | 🆓 open source, runs locally |
| ➕ | **[Wispr Flow](https://wisprflow.ai)** | 🪟🍎 | 💳 free tier |
| ➕ | **[Superwhisper](https://superwhisper.com)** | 🍎 | 💳 free tier, local models |

### Watch your usage and costs
- ✅ **`/context`** (Claude Code): what's filling your context window right now.
- ✅ ECC's **`cost-tracking`** skill and `/ecc:cost-report` command (see the [ECC guide](guides/ecc.md)).
- ➕ **[ccusage](https://github.com/ryoppippi/ccusage)** 🧑‍💻: daily, monthly and per-session token and cost reports from Claude Code's local logs (also Codex and OpenCode).

### Safety add-ons
- ✅ **GateGuard** (ECC hook): forces the agent to state facts before editing. See module 07.
- ✅ **safety-guard** (ECC skill): confirms dangerous commands.
- 🧪 **[cc-safety-net](https://github.com/kenryu42/claude-code-safety-net)**: a hook that blocks destructive shell commands (mass deletes, force pushes).
- ➕ **AgentShield** (ECC): scans your agent setup (prompts, hooks, MCP config, permissions) for risky settings and leaked secrets.

### Command-line helpers the agent uses
- ✅ **[GitHub CLI](https://cli.github.com)** (`gh`): lets the agent create repos, issues and pull requests for you.
- ✅ **[uv](https://docs.astral.sh/uv/)** 🧑‍💻: installs Python tools in one command; many skills and MCP servers need it.

---

## 11. A suggested upgrade path

| When you notice… | Add |
|---|---|
| "I lose my notes / I'm afraid of losing the vault" | Obsidian Git or Obsidian Sync |
| "My notes are inconsistent" | Templater + the pack's templates |
| "Typing all this context is slow" | A dictation app |
| "I can't find related notes anymore" | Smart Connections |
| "I keep typing the same request" | Write a skill (module 04), or find one with `find-skills` |
| "My work lives in Drive / Notion / Slack" | That one connector (section 6) |
| "I want to try other models cheaply" | OpenRouter (with Goose or OpenCode) |
| "I keep 3+ agent sessions open" | Windows Terminal, then Herdr |
| "I run the same team of agents every week" | OpenRig, or a Goose recipe |
| "I want an assistant I can text from my phone" | Hermes Agent or OpenClaw (read their security docs first) |
| "The trigger is outside my agent (a form, an email)" | n8n or Zapier |
| "I want more ready-made skills" | Matt Pocock's skills, then a *selection* from ECC |
| "My agent got slow and confused" | `/context`, then remove connectors and skills you don't use |
| "I worry about what the agent might do" | ECC's safety-guard, tighter permissions |
