---
name: vault-ingest
description: Ingest new sources into the user's Obsidian memory vault (LLM Wiki pattern). Use when the user adds files to inbox/ or a raw/ folder, clips an article, or says "ingest", "process the inbox" or "add this source to my notes".
---

# Vault ingest

The vault is the folder containing `AGENTS.md` and `index.md`: the current folder, or the vault path given in the user's global instructions. If you can't find it, ask.

1. Read the vault's `AGENTS.md` (and the domain's `schema.md` if there is one). Its rules win over this skill.
2. Read `index.md` to learn the domains and existing pages.
3. For each new item (in `inbox/`, or the file the user named):
   - Decide its domain. If it isn't obvious, ask.
   - Move it into `domains/<domain>/raw/`. **After that, never modify it.**
   - Read it fully.
   - Create a source summary in `domains/<domain>/wiki/sources/` from `templates/source-summary.md`.
   - Update existing wiki pages it informs, or create new ones from `templates/wiki-page.md`. Every claim cites the source summary.
   - Add `[[links]]` to related pages.
4. Update `index.md` and append one entry per source to `log.md`.
5. Report back in a short list: sources ingested, pages created, pages updated, and **any contradictions** with what the vault already said.

Never invent content that isn't in the source. If the source is unreliable, say so in its summary.
