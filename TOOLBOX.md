# Toolbox — alternatives and add-ons

The course uses Claude Code or Goose, Obsidian, and a few skills. This page is the **wider map**: other agents, better terminals, tools to run several agents side by side, memory add-ons, models, and everyday helpers.

**How to use it:** don't install everything. For each section, read the "which one?" line, pick **one** tool that fixes a problem you actually have, and come back later. Every tool you add costs attention, and often tokens.

Legend: 🆓 free / open source · 💳 paid (often with a free tier) · 🧑‍💻 more technical · 🪟 Windows · 🍎 macOS

> Tools in this space change monthly. Names, prices and features were checked in November 2026. Always install from the official site linked here.

---

## 1. Agents (harnesses)

*Reminder: the harness is the "body" around the model (module 00). All of these can read and write files and use tools; they differ in where they run and which models they accept.*

### No terminal needed (best for non-developers)

| Tool | What it is | Models | Cost |
|---|---|---|---|
| **[Claude Cowork](https://claude.com/blog/cowork-research-preview)** | Claude's desktop agent for everyday work: you pick a folder, and it reads, organises and writes files through chat. Same engine as Claude Code, no terminal | Claude | 💳 Paid Claude plans |
| **[Claude desktop app, Code tab](https://claude.ai/download)** | Claude Code in a window, with a file panel and a built-in browser | Claude | 💳 Pro/Max |
| **[Goose Desktop](https://goose-docs.ai)** | The Goose agent in a window, with extensions, recipes and a scheduler | Any | 🆓 + your model provider |

### In the terminal

| Tool | Why you'd pick it | Models | Cost |
|---|---|---|---|
| **[Claude Code](https://code.claude.com/docs/en/overview)** | The most capable agent loop; skills, subagents, hooks, plugins | Claude | 💳 |
| **[Goose CLI](https://goose-docs.ai)** | Any model, recipes, scheduler, subagents; open source (Agentic AI Foundation) | Any | 🆓 |
| **[OpenCode](https://opencode.ai)** | The closest open-source equivalent to Claude Code, 75+ providers, "plan" (read-only) vs "build" modes | Any | 🆓 |
| **[Codex CLI](https://github.com/openai/codex)** | OpenAI's agent; strong sandboxing (OS-level limits on what it can touch); reads `AGENTS.md` | OpenAI (+ local via Ollama) | 🆓 CLI, included with ChatGPT plans |
| **[Gemini CLI](https://github.com/google-gemini/gemini-cli)** | Google's open-source agent, very large context window | Gemini | 🆓 CLI; check Google's current pricing for usage |
| **[Kilo Code](https://kilo.ai)** | Open-source agent for the terminal and VS Code (successor of Roo Code) | Any | 🆓 + models billed separately |
| **[Aider](https://aider.chat)** | Lightweight pair-programmer: every edit is a Git commit, so nothing is lost | Any | 🆓 🧑‍💻 |
| **[Qwen Code](https://github.com/QwenLM/qwen-code)** | Open-source agent tuned for Qwen models (cheap, capable open models) | Qwen + others | 🆓 🧑‍💻 |

### Inside a code editor

| Tool | What it is | Cost |
|---|---|---|
| **[Cursor](https://cursor.com)** | AI-first code editor (VS Code-based) with an agent mode | 💳 free tier |
| **[Cline](https://cline.bot)** | Open-source agent extension for VS Code/JetBrains; asks approval for every step, with visual diffs | 🆓 + your provider |
| **[GitHub Copilot](https://github.com/features/copilot)** | Built into VS Code, with an agent mode | 💳 free tier |
| **[Zed](https://zed.dev)** | Very fast editor with a built-in agent panel | 🆓 editor |

### In the cloud (you hand off a task and review the result)

| Tool | What it is | Cost |
|---|---|---|
| **[Replit Agent](https://replit.com/products/agent)** | Builds and hosts small web apps from a description, with nothing to install. Popular with non-developers for prototypes | 💳 free tier |
| **[Devin](https://devin.ai)** | Autonomous software engineer that works in its own cloud machine and reports back | 💳 |
| **[OpenHands](https://github.com/OpenHands/OpenHands)** | Open-source autonomous agent you can self-host | 🆓 🧑‍💻 |

**Which one?** Non-developer, already paying for Claude: **Cowork** or the **desktop app**. Want any model, or to pay nothing for the app: **Goose Desktop**. Comfortable in the terminal and want an open-source Claude Code: **OpenCode**. You live in ChatGPT: **Codex**.

> 💡 **Your setup travels with you.** `AGENTS.md`, skills (`SKILL.md`) and MCP servers are open standards. Most of the tools above read them, so your vault, instructions and skills keep working when you switch.

---

## 2. Terminals: a nicer window

| Tool | What it is | Cost |
|---|---|---|
| **[Windows Terminal](https://aka.ms/terminal)** 🪟 | Microsoft's modern terminal: tabs, split panes, themes. Pin it to your taskbar; it replaces the old PowerShell window | 🆓 |
| **[WSL](https://learn.microsoft.com/windows/wsl/install)** 🪟 | Runs Linux inside Windows (`wsl --install`). Many agent tools are Linux/macOS-first; WSL makes them work on Windows | 🆓 🧑‍💻 |
| **[WezTerm](https://wezterm.org)** 🪟🍎 | Fast, highly configurable terminal | 🆓 |
| **[Ghostty](https://ghostty.org)** 🍎 | Fast, native terminal for macOS and Linux | 🆓 |
| **[Warp](https://www.warp.dev)** 🪟🍎 | Terminal with built-in AI and a friendlier, editor-like input | 💳 free tier |

**Which one?** Windows: **Windows Terminal** (and WSL once you need Linux tools). Mac: the built-in Terminal is fine; **Ghostty** if you want faster and prettier.

---

## 3. Running several agents side by side

Once you use subagents and teams (module 06), you'll want **several agent sessions open at once**: one researching, one writing, one testing. Two problems appear: keeping track of which agent needs you, and stopping agents from overwriting each other's files.

Three concepts, in plain English:
- **TUI (text user interface):** a menu-style app that runs inside the terminal, with panels and shortcuts instead of plain text.
- **Multiplexer:** one terminal window split into many sessions that **keep running in the background**, even if you close the window or the laptop lid.
- **Git worktree:** a second copy of the same project folder, managed by Git, so two agents can work on the same project without touching the same files.

| Tool | What it does | Platforms | Cost |
|---|---|---|---|
| **[Herdr](https://herdr.dev)** | A workspace manager **built for AI agents**: groups each project's sessions, shows in a sidebar which agent is working, idle or waiting for you, and keeps sessions alive (including on remote servers). Recognises Claude Code, Codex and other agents automatically | macOS, Linux, Windows via WSL | 🆓 |
| **[tmux](https://github.com/tmux/tmux/wiki)** | The classic multiplexer. Everything else builds on its ideas | macOS, Linux, WSL | 🆓 🧑‍💻 |
| **[Zellij](https://zellij.dev)** | A friendlier modern multiplexer, with on-screen shortcut hints | macOS, Linux, WSL | 🆓 |
| **[Claude Squad](https://github.com/smtg-ai/claude-squad)** | A TUI that runs several agents (Claude Code, Codex, Aider…), each in its own worktree, and lets you switch between them | macOS, Linux, WSL | 🆓 🧑‍💻 |
| **[dmux](https://github.com/standardagents/dmux)** | Minimal tool: one tmux pane plus one worktree per agent | macOS, Linux, WSL | 🆓 🧑‍💻 |
| **[ccmanager](https://github.com/kbwo/ccmanager)** | A TUI to list, start, stop and switch between agent sessions, with worktree support | macOS, Linux, WSL | 🆓 🧑‍💻 |
| **[Conductor](https://conductor.build)** | A Mac app: one workspace per task, running Claude Code, Codex and others in parallel | 🍎 | 💳 |
| **[Vibe Kanban](https://www.vibekanban.com)** | A kanban board where each card is a task handed to an agent | Cross-platform | 🆓 |

**Which one?** Start with what you have: Claude Code can already run subagents in parallel, and the Claude desktop app and Goose Desktop let you open several sessions. When you regularly run 3+ long sessions, try **Herdr** (agent-aware, survives a closed laptop). On a Mac, **Conductor** is the most visual option.

> ⚠️ Worktrees keep files apart, but they're **not a security boundary**: every agent still runs with your permissions on your computer.

---

## 4. Memory add-ons (around your Obsidian vault)

| Tool | What it adds | Cost |
|---|---|---|
| **[Smart Connections](https://github.com/brianpetro/obsidian-smart-connections)** (Obsidian plugin) | Finds related notes by meaning, not just keywords, using a local model with no API key | 🆓 |
| **[Copilot for Obsidian](https://github.com/logancyang/obsidian-copilot)** (plugin) | Chat with your vault from inside Obsidian; can also run agents like Claude Code inside the vault | 🆓 / 💳 |
| **[MCP Tools](https://github.com/jacksteamdev/obsidian-mcp-tools)** (plugin) | Lets Claude Desktop and other MCP apps read and search your vault | 🆓 |
| **[Obsidian Git](https://github.com/Vinzent03/obsidian-git)** (plugin) | Automatic backups of your vault to a private Git repository | 🆓 |
| **[Syncthing](https://syncthing.net)** | Syncs folders (e.g. your vault's `raw/` files) between your own devices, with no cloud | 🆓 |
| **[Obsidian Sync](https://obsidian.md/sync)** | Obsidian's official encrypted sync | 💳 |

**Which one?** Backup first: **Obsidian Git** or **Obsidian Sync**. Then, if your vault is large, **Smart Connections**. Don't run several AI plugins at once: each builds its own index of the same notes.

---

## 5. Skill and subagent libraries

| Library | What's in it | Start with |
|---|---|---|
| **[Matt Pocock — skills](https://github.com/mattpocock/skills)** | Small, sharp skills for planning and working well | `grill-me`, `to-spec`, `handoff` |
| **[ECC](https://github.com/affaan-m/ECC)** | 68 agents, 293 skills, hooks, memory, security scanning | Read the **[ECC guide](guides/ecc.md)** first |
| **[Anthropic — skills](https://github.com/anthropics/skills)** | Official example skills (documents, spreadsheets, presentations, design…) | Browse and pick |
| **[VoltAgent — subagents](https://github.com/VoltAgent/awesome-claude-code-subagents)** | 100+ subagent roles: business, research, product, engineering | Business and research packs |
| **[Agent Skills standard](https://agentskills.io)** | The open spec, plus the list of tools that support it | — |

---

## 6. Models and providers

| Tool | What it is | Cost |
|---|---|---|
| **[OpenRouter](https://openrouter.ai)** | One account and one API key for hundreds of models from every provider. Great with Goose or OpenCode to try models cheaply | 💳 pay per use |
| **[Ollama](https://ollama.com)** | Runs open models **locally on your computer**: free and private | 🆓 |
| **[LM Studio](https://lmstudio.ai)** | A desktop app to download and run local models, with a friendly interface | 🆓 |

**Choosing a model per role** (see the team in module 06): a fast, cheap model for reading and structuring; a strong model for the work people will see (writing, design, code); a multimodal model when it must look at images or screenshots.

---

## 7. Everyday helpers

### Talk instead of type
Explaining context by voice is 3–4× faster than typing it, and agents love context.

| Tool | Platforms | Cost |
|---|---|---|
| **Built-in voice mode** in Claude Code (`/voice`) and the Claude apps | All | Included |
| **[Handy](https://handy.computer)** | 🪟🍎 + Linux | 🆓 open source, runs locally |
| **[Wispr Flow](https://wisprflow.ai)** | 🪟🍎 | 💳 free tier |
| **[Superwhisper](https://superwhisper.com)** | 🍎 | 💳 free tier, local models |

### Watch your usage and costs
- **`/context`** (Claude Code): what's filling your context window right now.
- **[ccusage](https://github.com/ryoppippi/ccusage)** 🧑‍💻: daily, monthly and per-session token and cost reports from Claude Code's local logs (also Codex and OpenCode).
- ECC's **`cost-tracking`** skill and `/ecc:cost-report` command (see the [ECC guide](guides/ecc.md)).

### Let the agent use a browser
| Tool | What it does |
|---|---|
| **[Claude in Chrome](https://claude.com/chrome)** | Claude acts in your own Chrome browser: reads pages, fills forms, tests your site |
| **[Chrome DevTools MCP](https://github.com/ChromeDevTools/chrome-devtools-mcp)** | Gives any MCP agent a controllable Chrome: screenshots, console errors, performance |
| **[Playwright MCP](https://github.com/microsoft/playwright-mcp)** | Browser automation for any MCP agent, widely used for testing |
| **[OpenClaw](https://github.com/openclaw/openclaw)** 🧑‍💻 | Open-source assistant with strong browser automation, used for automated "dogfood" testing (module 06) |

### Safety add-ons
- **GateGuard** and **safety-guard** (ECC hooks): force the agent to state facts before editing, and confirm dangerous commands. See module 07 and the [ECC guide](guides/ecc.md).
- **AgentShield** (ECC): scans your agent setup (prompts, hooks, MCP config, permissions, agent files) for risky settings and leaked secrets.

---

## 8. A suggested upgrade path

| When you notice… | Add |
|---|---|
| "I lose my notes / I'm afraid of losing the vault" | Obsidian Git or Obsidian Sync |
| "Typing all this context is slow" | A dictation app |
| "I can't find related notes anymore" | Smart Connections |
| "I want to try other models cheaply" | OpenRouter (with Goose or OpenCode) |
| "I keep 3+ agent sessions open" | Windows Terminal, then Herdr |
| "I want more ready-made skills" | Matt Pocock's skills, then a *selection* from ECC |
| "My agent got slow and confused" | `/context`, then remove connectors and skills you don't use |
| "I worry about what the agent might do" | ECC's safety-guard, tighter permissions |
