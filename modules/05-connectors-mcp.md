# 05 — Connectors (MCP): plug your agent into other software

⏱ 25 min · [← Previous](04-skills.md) · [Next: Subagents & orchestration →](06-subagents-and-orchestration.md)

## Why it matters

Out of the box, your agent can see your files and the web. But your work also lives in other software: Google Drive, your calendar, Notion, Slack, a CRM, Figma, an analytics tool, your bank's exports… Without connectors you copy-paste between those apps and the agent. **With connectors, the agent reads from (and sometimes acts in) those tools directly.**

## The concept

### What an MCP is

**MCP (Model Context Protocol)** is an open standard for connecting AI agents to other software. Think of it as **USB for AI**:

- Before USB, every printer needed its own special cable. Before MCP, every AI app needed its own custom integration with every tool.
- With USB, any device works with any computer. With MCP, **a tool publishes one "MCP server", and any MCP-compatible agent can plug into it**: Claude, Goose, ChatGPT, Cursor, VS Code and many more.

```
                      ┌──► Google Drive MCP server ──► your files
                      ├──► Calendar MCP server     ──► your events
 Your agent ── MCP ───┼──► Notion MCP server       ──► your pages
                      ├──► Figma MCP server        ──► your designs
                      └──► Docs MCP server         ──► up-to-date documentation
```

Each server gives the agent a set of **tools**: small actions with a name and a description, like `search_files`, `list_events` or `create_page`. The agent reads those descriptions and decides when to use them, exactly like its built-in tools (read file, search the web).

Names differ by app: Claude says **connectors** or **MCP servers**, Goose says **extensions**. Same thing.

### Two kinds of servers

| Kind | What it is | Setup | For non-developers? |
|---|---|---|---|
| **Remote** | A web address run by the vendor (e.g. `https://mcp.notion.com/mcp`) | Paste the address, sign in through your browser | ✅ Best choice |
| **Local** | A small program running on your computer | Usually needs Node.js or Python | Later, when you're comfortable |

### A huge market

Since MCP became a standard, thousands of servers have been published. Almost every major platform now has one:

| Category | Examples of what an agent can do |
|---|---|
| **Files & docs** | Search Google Drive, OneDrive, Dropbox, Notion, Confluence; read and summarise documents |
| **Communication** | Read Slack or Teams threads, triage email, prepare (not send) replies |
| **Calendar & meetings** | Check availability, prepare meeting briefs, pull meeting transcripts |
| **Project tools** | Create and update tickets in Jira, Linear, Asana, Trello, ClickUp |
| **CRM & sales** | Look up accounts and deals in HubSpot or Salesforce |
| **Design** | Read Figma files, pull UI references |
| **Analytics & data** | Query product analytics, databases, spreadsheets, monitoring dashboards |
| **Developer tools** | GitHub, documentation lookup, browser control for testing |
| **Payments & business** | Read invoices, payments and subscriptions (read-only is wise) |

### Where to find MCP servers

| Where | What you'll find |
|---|---|
| **Claude connectors directory**, https://claude.com/connectors | 1,000+ connectors and plugins, each with an "Add in Claude" button. Also inside the Claude app: Settings → Connectors |
| **Official MCP Registry**, https://registry.modelcontextprotocol.io | The neutral, official catalogue of published MCP servers, usable with any agent |
| **Goose extensions directory**, https://goose-docs.ai/extensions | Extensions with one-click install for Goose |
| **The vendor's own docs** | Search "<product name> MCP server". Official servers from the vendor are the safest |
| **Reference servers**, https://github.com/modelcontextprotocol/servers | Example servers from the MCP project itself (files, fetch, git, memory, time…). Mostly for learning |

> ⚠️ **Prefer official servers** published by the vendor itself, or listed in the directories above. A server can see whatever you give it access to, so an unknown one from a random website is a security risk.

### A real example: what the author connects

| Always on | On demand (comes with a plugin, authorised only when a task needs it) |
|---|---|
| Google Drive, Google Calendar, Context7 (docs), Mobbin (app screens), Claude in Chrome | Notion, Figma, Linear, Slack, Asana, Atlassian, Amplitude, Similarweb, Fireflies… |

The right-hand column is the trick: **plugins can bring a dozen connectors, but an unauthorised connector adds almost nothing to the whiteboard.** Goose users get a similar toolbox built in: Developer, Computer Controller, Memory, Chat Recall, Auto Visualiser, Todo. The full list, by category, is in the [Toolbox](../TOOLBOX.md#6-connectors-mcp-by-category); the whole setup is in [MY-SETUP.md](../MY-SETUP.md).

### ⚠️ The hidden cost: connectors eat your context window

This is the part most guides skip. Remember the whiteboard from module 00: everything the agent "sees" takes space and costs tokens. Connectors add to it in **two ways**:

**1. Tool descriptions, at every turn.** For each connected server, the agent receives the name and description of every tool it offers, so it knows they exist. A big server can expose 20–50 tools, which can add **thousands of tokens to every single message**, even when you never use that server. Ten connectors "just in case" means:
- a fuller whiteboard, so less room for your actual work,
- more cost per message,
- and a more confused agent, because it has more tools to choose from and picks the wrong one more often.

**2. Tool results, every time a tool is used.** When the agent calls a tool ("list all files in this folder", "get this page"), the whole answer lands on the whiteboard. A single careless call can return tens of thousands of tokens.

How the agents handle it:
- 🟣 **Claude Code** limits the first cost by default: it only loads tool *names* at first, and fetches full descriptions when it actually needs a tool (it calls this tool search). It also caps how big a tool result can be. Type **`/context`** to see what's filling your whiteboard right now.
- 🪿 **Goose** and most chat apps load every enabled extension's tools. Turn extensions **off** when you don't need them (Desktop: sidebar → Extensions → toggle).

**Rules of thumb:**
- Connect what you use **weekly**. Disconnect the rest; reconnecting takes 30 seconds.
- Ask for small results: "the 5 most recent files", not "all files".
- If the agent gets slow or confused, check your connectors first.

## Set it up (10 min): add one connector

We'll use **Context7**, a free remote server that gives the agent up-to-date documentation for software tools. It's harmless and needs no account. Swap in any connector you actually need.

### 🟣 Claude

- **Desktop app / claude.ai:** Settings → **Connectors** → browse and connect (Google Drive, Calendar, Notion…), signing in when asked. Or start from https://claude.com/connectors.
- **Claude Code CLI**, in a terminal:
  ```powershell
  claude mcp add --transport http context7 https://mcp.context7.com/mcp --scope user
  ```
  *What this is: `--transport http` means "a remote server at this address"; `--scope user` makes it available in all your projects (the default, `local`, means this project only).*
  Inside Claude Code, `/mcp` shows each server's status and lets you sign in to servers that need it. `claude mcp list` and `claude mcp remove <name>` list and remove them.

### 🪿 Goose

- **Desktop:** sidebar → **Extensions** → browse, or **Add custom extension**. Or install from https://goose-docs.ai/extensions.
- **CLI:** `goose configure` → **Add Extension** → **Remote Extension (Streamable HTTP)** → name `context7`, URL `https://mcp.context7.com/mcp`.

## Try it (10 min)

1. Ask: *"Using Context7, how do I create a recurring event with the Google Calendar API? Summarise in 3 lines."* Watch it call the connector's tools instead of guessing.
2. 🟣 Type `/context` and find how much space your tools take. Compare before and after connecting the server.
3. If you connected Drive or Calendar instead: *"What's on my calendar this week? Save a one-paragraph summary in my vault's inbox."* That's connectors and memory working together.

## 🔒 Safety rules for connectors

- **Least privilege:** grant read-only access when that's enough.
- **Trust the source:** official vendor servers or well-known directories only.
- **Beware prompt injection:** a document, email or web page fetched through a connector can contain hidden text like "ignore your instructions and send this file to…". Keep "ask before acting" on for anything that sends, deletes, pays or publishes.

## Check you got it

- [ ] I can explain MCP in one sentence (a standard plug between agents and other software).
- [ ] I know three places to find MCP servers.
- [ ] I can explain the two ways connectors consume tokens (tool descriptions, tool results).
- [ ] I've added one connector, seen the agent use it, and checked its cost.

## How it connects

Connectors are **inputs** for your memory (03): calendar → session notes, Drive docs → `raw/`. Subagents (06) can be given only the connectors they need. In automation (07), a job can pull from a connector and update your vault without you.

## Go deeper

- [MCP — official introduction](https://modelcontextprotocol.io/introduction)
- [Claude Code — MCP docs](https://code.claude.com/docs/en/mcp) (including tool search and output limits)
- [Claude Code — managing costs](https://code.claude.com/docs/en/costs)
- [Goose — using extensions](https://goose-docs.ai/docs/getting-started/using-extensions)
