# Sample vault — "Opening a weekend coffee cart"

> ⚠️ **Everything here is fictional.** The people, places, prices and quotes were invented for teaching. Don't use them as real business data.

This is what a vault looks like after **about six weeks and eight sessions** of real use. Compare it with the empty [vault-template](../vault-template/): same rules ([AGENTS.md](AGENTS.md)), same folders, but now with sources, linked wiki pages, session notes, a log and a lint report.

## How to explore it (10 min)

1. Open this folder in Obsidian (**Open folder as vault**), then open the **graph view** (Ctrl/Cmd+G). Each dot is a page; each line is a link.
2. Read [index.md](index.md) first, exactly as the agent does.
3. Follow one decision back to its evidence: [Decision: where to start](domains/coffee-cart/wiki/decision-first-pitch.md) → the pages it cites → the source summaries → the untouched notes in `raw/`.
4. Open [log.md](log.md) to see the history, and the [lint report](sessions/2026-10-20-lint-report.md) to see the agent catching its own mistakes.

## Try it with your agent (10 min)

Start your agent **in this folder** and ask:
- *"What do we know about permits? Cite the pages you used."*
- *"Which pitch has more morning foot traffic, and how confident are we?"*
- *"What's still undecided about this project?"*
- *"Lint the vault."* (It should find the issues already listed in the lint report, unless you fix them first.)

Notice the answers cite pages, and say what the vault *doesn't* know. That's the whole point.

## Anatomy

| Folder / file | In this sample |
|---|---|
| `index.md` | The map: 3 domains with different tiers, 10 wiki pages, 3 recent sessions |
| `log.md` | 9 operations, from vault creation to the latest lint |
| `domains/coffee-cart/raw/` | 4 original notes (interview, foot-traffic count, supplier quotes, a phone call). Never edited |
| `domains/coffee-cart/wiki/sources/` | 4 source summaries, one per raw note |
| `domains/coffee-cart/wiki/` | 6 pages: concepts, a person, a decision, each citing its sources |
| `domains/reading-notes/` | A **light index** domain: raw files plus a list, no concept pages |
| `domains/personal-admin/` | A **storage** domain: the agent never opens it |
| `sessions/` | Two work sessions and one lint report |
