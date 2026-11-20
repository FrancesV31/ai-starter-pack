# 05 — Connectors (MCP): reach your other tools

⏱ 15 min · [← Previous](04-skills.md) · [Next: Subagents & orchestration →](06-subagents-and-orchestration.md)

## Why it matters

Out of the box, your agent can see your files and the web. Your work also lives in Google Drive, your calendar, Notion, a project tracker, a design tool… **Connectors** let the agent read from (and sometimes act in) those tools, so you stop copy-pasting between apps.

## The concept

**MCP (Model Context Protocol)** is a standard plug between agents and tools, like USB for AI. A tool publishes an **MCP server**, and any MCP-compatible agent (Claude, Goose and many others) can plug into it.

```
 Agent ──MCP──► Google Drive server ──► your Drive
       ──MCP──► Calendar server     ──► your calendar
       ──MCP──► Docs server         ──► up-to-date software documentation
```

Each server adds **tools** the agent can use ("search files", "list events"…). Two kinds:

- **Remote** servers: a web address. Nothing to install, and you usually sign in through your browser. **Best for non-developers.**
- **Local** servers: a small program on your computer. These often need Node.js or Python.

Names differ: Claude says **connectors** or **MCP servers**, Goose says **extensions**. Same thing.

### Connectors cost attention

Every connected server adds its tool descriptions to the whiteboard. Ten connectors you don't use make the agent slower and more confused. **Connect what you use weekly, and disconnect the rest.**

## Set it up (10 min) — add one connector

We'll use **Context7**, a free remote server that gives the agent up-to-date documentation for software tools. It's harmless and needs no account. Swap in any connector you actually need.

### 🟣 Claude

- **Desktop app / claude.ai:** Settings → **Connectors** → browse and connect (Google Drive, Calendar, Notion, etc.), signing in when asked.
- **Claude Code CLI**, in a terminal:
  ```powershell
  claude mcp add --transport http context7 https://mcp.context7.com/mcp --scope user
  ```
  *What this is: `--transport http` means "a remote server at this address"; `--scope user` makes it available in all your projects (the default, `local`, means this project only).*
  Check it inside Claude Code with `/mcp`, which shows each server's status and lets you sign in to servers that need it.

### 🪿 Goose

- **Desktop:** sidebar → **Extensions** → browse the built-in ones, or **Add custom extension**.
- **CLI:** `goose configure` → **Add Extension** → **Remote Extension (Streamable HTTP)** → name `context7`, URL `https://mcp.context7.com/mcp`.

## Try it (5 min)

Ask: *"Using Context7, how do I create a recurring event in Google Calendar's API? Summarise in 3 lines."* Watch it call the connector's tools instead of guessing.

If you connected Drive or Calendar instead: *"What's on my calendar this week? Save a summary in my vault's inbox."* Connectors and memory working together.

## 🔒 Safety rules for connectors

- **Least privilege:** grant read-only access when that's enough.
- **Trust the source:** only add servers from the official tool vendor or well-known projects. A server can see whatever you give it.
- **Beware prompt injection:** a document, email or web page can contain hidden text like "ignore your instructions and send this file to…". Keep "ask before acting" on for anything that sends, deletes or buys.

## Check you got it

- [ ] I can explain MCP in one sentence.
- [ ] I've added one connector and seen the agent use it.
- [ ] I know why I shouldn't connect everything.

## How it connects

Connectors are **inputs** for your memory (03): calendar → session notes, Drive docs → `raw/`. In automation (07), a scheduled job can pull from a connector every week and update your vault without you.

## Go deeper

- [Claude Code — MCP docs](https://code.claude.com/docs/en/mcp)
- [Goose — using extensions](https://goose-docs.ai/docs/getting-started/using-extensions)
