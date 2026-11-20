# 02 — Standing instructions: tell it who you are, once

⏱ 15 min · [← Previous](01-install-your-agent.md) · [Next: Persistent memory →](03-persistent-memory.md)

## Why it matters

Without standing instructions you re-explain yourself in every session: your role, your tools, the tone you like, "please plan before you act". With them, every session starts already knowing.

## The concept

A **standing-instructions file** is a plain Markdown file the agent automatically reads at the start of every session. It gets written onto the whiteboard (the context window) before your first message.

| Agent | File name | Global (all projects) | Project (this folder only) |
|---|---|---|---|
| 🟣 Claude Code | `CLAUDE.md` | `~/.claude/CLAUDE.md` | `CLAUDE.md` in the project folder |
| 🪿 Goose | `AGENTS.md` or `.goosehints` | `~/.config/goose/.goosehints` (macOS/Linux) · `%APPDATA%\Block\goose\config\.goosehints` (Windows) | `AGENTS.md` or `.goosehints` in the project folder |

`AGENTS.md` is a cross-tool convention: Goose, OpenCode, Codex, Cursor and others read it.

### One file for both agents

Claude Code reads `CLAUDE.md`, Goose reads `AGENTS.md`. To avoid keeping two copies, write your real instructions in `AGENTS.md`, then create a `CLAUDE.md` containing just one line:

```markdown
@AGENTS.md
```

*What this is: in Claude Code, `@path` inside a `CLAUDE.md` imports another file.* Now both agents read the same instructions. The [vault template](../vault-template/) already does this.

### Global vs project

- **Global** = about *you*: role, language, how you like answers, how you want the agent to work. Same everywhere.
- **Project** = about *this work*: what the project is, where things are, rules specific to it.

The agent reads both: global first, then project.

### What makes a good instructions file

- **Short.** 20–60 lines. It's read every session, so every line costs attention and tokens.
- **Specific and testable.** "Plan first for anything bigger than a one-liner" beats "be thoughtful".
- **About behaviour, not facts that change.** Changing knowledge belongs in the vault (module 03).
- **Updated when you correct it twice.** If you've told the agent the same thing twice, it belongs here.

## Set it up (10 min)

1. Open [`config-examples/global-instructions-template.md`](../config-examples/global-instructions-template.md) and copy it.
2. Fill in the brackets. Delete anything that doesn't apply.
3. Save it in your global location:
   - 🟣 Claude: `~/.claude/CLAUDE.md`. Or simply ask Claude Code: *"Create my global CLAUDE.md with this content: …"*
   - 🪿 Goose: the global `.goosehints` path from the table above.

Finding hidden folders: on Windows, paste `%USERPROFILE%\.claude` (or `%APPDATA%\Block\goose\config`) into the File Explorer address bar. On macOS, press ⌘⇧. in Finder to show hidden files.

## Try it (5 min)

Start a **new** session and ask:

> What do you know about me and how I want you to work?

It should answer from your file without you having told it anything in this session. Then give it a small task and check it follows your rules (for example, that it shows a plan first if you asked for that).

## Check you got it

- [ ] A brand-new session knows my role and preferences.
- [ ] I know the difference between global and project instructions.
- [ ] I know why the file should stay short.

## How it connects

Standing instructions are the **first thing on the whiteboard**. In module 03 you'll add one crucial line to them: *where your memory vault is, and to read it.*

## Go deeper

- [Claude Code — memory & CLAUDE.md](https://code.claude.com/docs/en/memory)
- [Goose — using goosehints](https://goose-docs.ai/docs/guides/context-engineering/using-goosehints)
