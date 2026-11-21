# AGENTS.md — rules for this memory vault

> Obsidian is the IDE. The LLM is the programmer. The wiki is the codebase.
> (pattern: Andrej Karpathy, "LLM Wiki")

This folder is my **persistent memory**. You, the agent, maintain it: you read it to get context and write to it what we learn. I curate sources and ask questions; you do the bookkeeping.

## Structure

```
./
├── AGENTS.md          ← these rules (read every session)
├── CLAUDE.md          ← one line that imports this file for Claude Code
├── index.md           ← map of everything in the vault. READ THIS FIRST
├── log.md             ← chronological log of every operation. Append only
├── inbox/             ← new, unprocessed material (web clips, quick notes)
├── sessions/          ← one note per meaningful work session
├── templates/         ← page templates (session note, wiki page, source summary)
└── domains/
    └── <domain>/
        ├── schema.md  ← extra rules for this domain (optional)
        ├── raw/       ← original sources. IMMUTABLE
        └── wiki/      ← pages you write and maintain
```

## Golden rules

1. **Never modify, rename or delete anything in a `raw/` folder.** Raw sources are the ground truth. To file a new source, *move* it from `inbox/` into `raw/` once, then never touch it again.
2. **Every factual claim in the wiki cites its source**, using a wikilink to the source summary page or a path to the raw file. No source means the claim doesn't go in, or it goes in clearly marked `(unverified)`.
3. **Read `index.md` first.** Then open only the pages relevant to the task. Never read the whole vault.
4. **One concept per page.** Split broad topics. Link related pages with `[[Page name]]`.
5. **Update the map.** Whenever you create, rename or delete a wiki page, update `index.md` in the same task.
6. **Log every operation** in `log.md` (format below).
7. **Dates are ISO**: `YYYY-MM-DD`.
8. **Never write secrets** (passwords, API keys, card or ID numbers) anywhere in the vault.
9. **Respect domain tiers** (listed in `index.md`). Never open or modify *Storage* domains.
10. **When unsure, ask.** Don't guess at structure or invent facts.

## Page conventions

- File names: lowercase words separated by hyphens, e.g. `wiki/pricing-models.md`. The page title (first `#` heading) can be normal text.
- Start every wiki page from `templates/wiki-page.md`, every source summary from `templates/source-summary.md`, and every session note from `templates/session-note.md`.
- Frontmatter on wiki pages: `type`, `sources`, `updated`.
- Prefer updating an existing page over creating a near-duplicate.

## Operations

### Ingest: "ingest", "process the inbox", "add this source"
1. If the material is in `inbox/`, ask which domain it belongs to (or infer it from `index.md`, and say so), then move it to `domains/<domain>/raw/`.
2. Read the source fully.
3. Write a **source summary** page in `domains/<domain>/wiki/sources/`: what it is, key points, notable quotes (short), and its reliability.
4. For each important concept, person or project it mentions: **update** the existing wiki page, or **create** one. Add a citation to the source summary.
5. Add `[[links]]` between the new and related pages.
6. Update `index.md` and append to `log.md`.
7. Report: pages created, pages updated, and any contradictions with what the wiki already said.

### Query: "what do we know about…", "according to my notes…"
1. Read `index.md`, then open the relevant pages (follow links one or two hops if needed).
2. Answer **with citations** to the pages used.
3. Say clearly what the vault does *not* cover, and suggest sources to add.
4. If the answer is valuable and new, offer to save it as a wiki page.

### Lint: "lint the vault", "health check"
Check and report, grouped by severity:
- Broken `[[links]]`, and pages missing from `index.md` (or index entries with no page)
- Orphan pages (no page links to them)
- Duplicates or near-duplicates
- Claims without a source; contradictions between pages
- Pages not updated in 6+ months that cover fast-changing topics
- Files left in `inbox/` for more than 7 days

Fix only the safe, mechanical issues (links, index entries) without asking. List everything else for me to decide. Write the report to `sessions/YYYY-MM-DD-lint-report.md` and log it.

### Session wrap: "wrap up", "save this session", end of a meaningful session
1. Create `sessions/YYYY-MM-DD-<short-topic>.md` from the template: goal, what we did, **decisions (and why)**, what we learned, open questions, next steps.
2. Move durable knowledge into the right wiki pages (decisions and learnings belong in the wiki, not only in the session note).
3. Update `index.md` and `log.md`.

## Log format (`log.md`)

Newest entries at the bottom, one block per operation:

```
## [2026-01-15] ingest | example-domain | Article title
Created 2 pages (…), updated 1 (…). Contradiction noted on …
```

Operations: `ingest`, `query` (only when a page was saved), `lint`, `session`, `update`, `restructure`.

## Adding a domain

When I start a new topic: create `domains/<name>/raw/` and `domains/<name>/wiki/`, add an optional `schema.md` for its specific rules, and register it in `index.md` with its tier.
