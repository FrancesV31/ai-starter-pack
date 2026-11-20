# Glossary

Plain-English definitions, in the order you'll meet them in the course.

| Term | What it means |
|---|---|
| **LLM (Large Language Model)** | The "brain": a program trained on huge amounts of text that predicts the next piece of text. Claude, GPT, Gemini, Mistral and Llama are LLMs. |
| **Model provider** | The company or service that runs the model for you and bills you (Anthropic, OpenAI, Google, Mistral, OpenRouter…). Or your own computer, for local models. |
| **Token** | The unit the model reads and writes, roughly ¾ of an English word. Cost and memory limits are counted in tokens. |
| **Context window** | Everything the model can "see" at once: your messages, its replies, files it has read, tool results. Its short-term memory. When the session ends, it's gone. |
| **Prompt** | What you send to the model. In an agent, your prompt is wrapped with a lot of other text (instructions, tool descriptions, files). |
| **Agent** | A model that can *act*: read and write files, run commands, search the web, then look at the result and decide the next step, in a loop, until the task is done. |
| **Harness** | The program around the model that gives it tools and runs the loop. Claude Code and Goose are harnesses. Model = brain, harness = body. |
| **Agent loop** | Think → act (use a tool) → observe the result → think again. Repeats until done. |
| **Tool** | One action the agent can take: "read file", "run command", "search the web". |
| **Terminal / shell** | A text window where you type commands. On Windows: **PowerShell**. On macOS: **Terminal**. |
| **CLI (Command-Line Interface)** | A program you use by typing commands in the terminal, e.g. `claude` or `goose`. |
| **API key** | A secret password that lets a program use a provider's model and bills your account. Treat it like a credit card number. |
| **Standing instructions** | A file the agent reads at the start of every session: who you are, how you want it to work. `CLAUDE.md`, `AGENTS.md`, `.goosehints`. |
| **Markdown** | Plain text with light formatting (`# Title`, `**bold**`, `- list`). Files end in `.md`. Both humans and AIs read it easily. |
| **Obsidian** | A free app for writing and linking Markdown notes. Your notes stay plain files in a folder on your computer. |
| **Vault** | An Obsidian folder of notes. In this course: your agent's persistent memory. |
| **Wikilink** | A link between notes, written `[[Note name]]`. Obsidian turns these into a clickable web of knowledge (the "graph"). |
| **LLM Wiki** | A pattern described by Andrej Karpathy: you collect raw sources, the AI writes and maintains a linked wiki from them, and you read and question it. |
| **Ingest / Query / Lint** | The three LLM Wiki operations: add a source and update the wiki / ask the wiki a question / health-check the wiki for errors and gaps. |
| **Skill** | A folder with a `SKILL.md` file that teaches the agent one repeatable workflow. Loaded only when needed. An open standard that works in many agents. |
| **Slash command** | Typing `/name` in the agent to run a skill or built-in command on purpose. |
| **Progressive disclosure** | The agent first sees only each skill's one-line description, and loads the full instructions only when relevant. That's why you can install many skills cheaply. |
| **MCP (Model Context Protocol)** | A standard "plug" that connects an agent to an outside tool or service (Google Drive, a calendar, documentation, a browser…). |
| **MCP server / connector / extension** | One such plug. Claude calls them connectors or MCP servers, Goose calls them extensions. |
| **Subagent** | A helper agent your main agent starts for one job. It gets a fresh, empty context, does the work, and returns only a short report. |
| **Orchestration** | Coordinating several agents: who does what, in what order, and how results are combined and checked. |
| **Orchestrator** | The agent (or you) that splits the work, dispatches it, and reviews results. |
| **Culture file** | A short list of shared working principles the orchestrator gives to every specialist, so a team of fresh-context agents behaves consistently. |
| **QA gate** | A checkpoint where the orchestrator refuses any work that comes back without proof (test results, screenshots, sources). |
| **Dogfooding** | Using your own product as a real user would, to find what's broken or confusing. A "dogfood" agent does this automatically. |
| **Fact-check** | Checking each claim in a document against independent sources. Essential for AI-written text, which can invent sources. |
| **Recipe (Goose)** | A saved, reusable workflow file (YAML) with instructions, a prompt, settings and parameters. It can be run, shared or scheduled. |
| **Headless mode** | Running an agent with a single command and no chat window (`claude -p "…"`, `goose run -t "…"`). Needed for automation. |
| **Hook** | A rule that runs automatically when something happens in the agent (e.g. "when you finish, play a sound"). |
| **Loop** | Running the same prompt repeatedly until a goal is met or a limit is reached. Always give it a stop condition and a maximum. |
| **Ralph loop** | A Claude Code plugin that feeds the same task back to the agent each time it tries to stop, until it declares a pre-agreed finish line. |
| **Escalation gate** | A rule that stops an automated loop and asks the human (e.g. "the same step failed 3 times"). |
| **Schedule / cron** | Running a task at fixed times ("every Monday at 9:00"). Cron is the classic notation for writing those times. |
| **Permission mode** | How much the agent may do without asking you. Start strict, loosen as trust grows. |
| **Prompt injection** | Hidden instructions inside a web page, email or document that try to make the agent do something you didn't ask. A key reason to keep permissions tight. |
| **TUI (text user interface)** | A menu-style app that runs inside the terminal, with panels and keyboard shortcuts instead of plain text output. |
| **Multiplexer** | A tool that splits one terminal window into many sessions that keep running in the background, even when you close the window (tmux, Zellij, Herdr). |
| **Git worktree** | A second working copy of the same project, managed by Git, so two agents can work in parallel without touching the same files. |
| **WSL** | Windows Subsystem for Linux: runs Linux inside Windows, so Linux-first tools work on a Windows PC. |
| **Plugin (Claude Code)** | A bundle that installs several things at once: skills, subagents, hooks and connectors. Added with `/plugin`. |
| **Personal (always-on) agent** | An agent that runs all the time on your computer or a server, remembers you, and that you message from a chat app (Hermes Agent, OpenClaw). |
| **Control plane** | A dashboard or tool that starts, watches and stops many agents as one system (e.g. OpenRig). |
| **Local model** | A model running on your own computer (via Ollama or LM Studio): free and private, usually less capable than the big cloud models. |
| **Git / GitHub** | Git tracks versions of files (a time machine for folders). GitHub hosts them online. Useful for backing up your vault and sharing skills. |
