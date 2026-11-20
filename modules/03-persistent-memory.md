# 03 — ⭐ Persistent memory with Obsidian

⏱ 60 min · [← Previous](02-standing-instructions.md) · [Next: Skills →](04-skills.md)

## Why it matters

This is the module that changes how you work with AI.

Without memory, every session is a smart stranger. With a memory vault, every session builds on the last: decisions you made, sources you read, what worked and what didn't. **Knowledge compounds** instead of evaporating in old chats. And because the memory is a folder of plain files, it works with *any* agent, Claude or Goose, today or in five years.

## The concept

### Why Obsidian?

[Obsidian](https://obsidian.md) is a free note-taking app with three properties that make it a perfect memory for agents:

1. **Your notes are plain Markdown files in a normal folder.** No database and no lock-in. Any agent can read and write them, and so can you.
2. **Notes link to each other** with `[[wikilinks]]`, forming a web of knowledge you can browse and see as a graph.
3. **It's local.** Your memory stays on your computer unless you decide to sync it.

So the agent writes files, and Obsidian is the comfortable window through which *you* read, browse and correct them.

### The LLM Wiki pattern (Andrej Karpathy)

In 2026 Andrej Karpathy (OpenAI co-founder and former head of AI at Tesla) described a simple pattern that this module follows. His one-line summary:

> *"Obsidian is the IDE, the LLM is the programmer, the wiki is the codebase."*

The idea: **you curate sources and ask questions; the AI does the bookkeeping.**

```
   YOU add                    THE AGENT maintains                  YOU read & ask
 ┌───────────┐   ingest    ┌──────────────────────────┐   query   ┌──────────────┐
 │  raw/     │ ──────────► │  wiki/                   │ ◄──────── │  questions,  │
 │ articles, │             │  one page per concept,   │ ────────► │  decisions   │
 │ PDFs,     │             │  linked with [[...]],    │  answers  └──────────────┘
 │ notes     │             │  every claim cites a     │  (with sources)
 │(never     │             │  source                  │
 │ edited)   │             │  + index.md  + log.md    │ ◄── lint: weekly health check
 └───────────┘             └──────────────────────────┘
```

Three layers:

| Layer | What | Who writes it | Rule |
|---|---|---|---|
| `raw/` | Original sources: clipped articles, PDFs, meeting notes, transcripts | You | **Immutable.** The agent never edits them. It's your ground truth |
| `wiki/` | Compiled knowledge: concept pages, people, projects, decisions, source summaries | The agent | Every claim links back to a source in `raw/` |
| Schema (`AGENTS.md`) | The rules: structure, naming, how to ingest, how to answer | You (with the agent's help) | Read at the start of every session |

Three operations:

| Operation | You say | The agent does |
|---|---|---|
| **Ingest** | "Ingest the new source in raw/" | Reads it, writes a source summary, creates or updates concept pages, adds links, updates `index.md`, appends to `log.md` |
| **Query** | "What do we know about X?" | Reads `index.md`, opens the relevant pages, answers **with links to its sources**, and says what's missing |
| **Lint** | "Lint the vault" | Finds broken links, orphan pages, duplicates, contradictions, stale pages, and claims without sources. Reports, then fixes what you approve |

Plus one habit that turns it into *working* memory, not just a library:

| Habit | When | The agent does |
|---|---|---|
| **Session wrap** | End of any meaningful session | Writes a short note in `sessions/`: what we did, what we decided, what we learned, what's next. Updates the index |

### Two special files: `index.md` and `log.md`

- **`index.md`** is the table of contents. The agent reads it first to know what exists *without reading everything*. This is how a vault with 500 notes still fits on a small whiteboard: the agent reads the map, then opens only the 3–5 pages it needs.
- **`log.md`** is a chronological diary of every operation ("2026-11-20 — ingested article X, created 2 pages"). It lets you, and the next session, see what happened and when.

### Domains: one vault, many topics

As your vault grows, split it into **domains** (career, a side project, a hobby, a client…), each with its own `raw/`, `wiki/` and a small `schema.md` for domain-specific rules. Not everything deserves the full treatment:

| Tier | Use for | Structure |
|---|---|---|
| **Full wiki** | Topics you actively think about and ask questions on | `raw/` + `wiki/` + `schema.md` |
| **Light index** | Reference material you just need to *find* (contracts, receipts, manuals) | `raw/` + an `index.md` listing the files |
| **Storage** | Personal files the agent should never touch | Folders only, and tell the agent to stay out |

## Set it up (30 min)

### 1. Install Obsidian

Download it from https://obsidian.md and install it. It's free for personal use.

### 2. Create your vault from the template

1. Copy the [`vault-template/`](../vault-template/) folder from this pack to a permanent place, for example `Documents/my-vault`. Rename it however you like.
2. In Obsidian: **Open folder as vault** → pick that folder.
3. Look around: `AGENTS.md` (the rules), `index.md`, `log.md`, `inbox/`, `sessions/`, `domains/example-domain/`.

### 3. Install the browser clipper

Install the official **Obsidian Web Clipper** from https://obsidian.md/help/web-clipper (Chrome, Edge, Firefox, Safari). Use the links on that page, because look-alike extensions exist. In its settings, set the default save folder to `inbox`.

*What this is: one click saves any web page as a clean Markdown file in your vault, ready to be ingested.*

### 4. Optional community plugins

Obsidian → Settings → Community plugins → Browse:

| Plugin | Why |
|---|---|
| **Dataview** | Query your notes like a database ("all decisions from this month") |
| **Templater** | Fill note templates automatically (dates, titles) |
| **Obsidian Git** | Automatic backup of your vault to a private Git repository |
| **Excalidraw** | Sketch diagrams inside notes |

None are required. Start without them, and add them when you feel the need. AI plugins (Smart Connections for finding related notes by meaning, Copilot for chatting with your vault, MCP plugins that connect the vault to Claude Desktop) are compared in the [Toolbox](../TOOLBOX.md#4-memory-add-ons-around-your-obsidian-vault).

### 5. Connect the vault to your agent

Two ways, and you'll use both:

- **Work inside the vault.** Start the agent with the vault as its working folder. It reads `AGENTS.md` (Goose) or `CLAUDE.md` → `@AGENTS.md` (Claude) automatically.
- **Work elsewhere, but remember.** Add this to your **global** instructions (module 02) so that every project can use the vault:

```markdown
## Memory
My persistent memory is an Obsidian vault at: <full path to your vault>
- At the start of a task, read its index.md and open only the pages relevant to the task.
- At the end of a meaningful session, write a session note in sessions/ (follow the vault's AGENTS.md) and update index.md and log.md.
- Never modify anything in raw/ folders.
```

### 6. Install the vault skills (optional but recommended)

This pack includes four small skills that encode the operations above: `vault-ingest`, `vault-query`, `vault-lint` and `session-wrap` (plus `fact-check`, covered in modules 04 and 06). Module 04 explains skills. To install them now, run from the pack folder:

```powershell
.\setup\install-starter-skills.ps1
```

Then you can just type `/vault-ingest` instead of explaining the procedure each time. Without the skills, the same operations work by asking in plain English, because the rules are in `AGENTS.md`.

## Try it (20 min)

1. **Clip 3 articles** on a topic you care about with the Web Clipper. They land in `inbox/`.
2. Start your agent in the vault folder and say:
   > Move the files in inbox/ into domains/example-domain/raw/ and ingest them, following AGENTS.md.
3. In Obsidian, open the new pages. Click the links. Open the **Graph view** (left sidebar) and watch your knowledge become a web.
4. **New session.** Ask: *"What do we know about <topic>? Cite your sources."* Notice that it answers from your vault, with links.
5. Finish with: *"Wrap up this session."* Then open the new note in `sessions/`.
6. **Start one more new session** and ask: *"What did we do last time?"* 🎉 That's persistent memory.

## Check you got it

- [ ] I can explain raw vs wiki vs schema, and why `raw/` is never edited.
- [ ] A brand-new session can tell me what happened in a previous one.
- [ ] Answers cite pages in my vault.
- [ ] I know what should *never* go in the vault (see below).

## Pitfalls and good habits

- **Garbage in, garbage out.** The wiki is only as good as the sources you add. Curate.
- **Insist on sources.** The schema requires every claim to link to a source. If the agent writes something without one, that's a lint error. This is your main defence against made-up facts.
- **Review early ingests.** The first 5–10 times, read what the agent wrote and correct it. Then fix the *rules* in `AGENTS.md` so the mistake doesn't come back.
- **Lint weekly.** Wikis rot: links break, pages duplicate, facts go stale. Module 07 shows how to loop or schedule it.
- **Keep the index honest.** If `index.md` drifts from reality, the agent can't find things. The lint operation checks this.
- **One vault.** Don't let two copies of your vault drift apart. Pick one folder and back it up.

## 🔒 Privacy: what to keep out

Whatever is in the vault can end up in the context window, which means it's sent to your model provider.

- **Never store passwords, API keys, card numbers or ID numbers** in the vault.
- For sensitive personal documents (health, legal, finances), use a **Storage tier** domain the agent is told never to open, or keep them outside the vault entirely.
- If you back up with Git, keep the repository **private**, and consider excluding `raw/` (the template's `.gitignore` shows how).
- Want zero data leaving your machine? Use the Goose path with a local Ollama model.

## How it connects

- **Standing instructions** (02) tell the agent the vault exists and how to use it.
- **Skills** (04) turn ingest, query, lint and wrap into one-word commands.
- **Subagents** (06) write their research reports into the vault, so the team shares one memory.
- **Automation** (07): improvement loops write a summary to the vault after every cycle, and a scheduled job can lint the vault without you.

## Go deeper

- ⭐ [Karpathy — LLM Wiki idea file](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
- [Community implementations](https://github.com/balukosuri/llm-wiki-karpathy)
- [Obsidian Web Clipper](https://obsidian.md/help/web-clipper)
