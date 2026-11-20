---
name: session-wrap
description: Save what happened in this work session to the user's Obsidian memory vault. Use when the user says "wrap up", "save this session", "remember this", or at the end of a meaningful session.
---

# Session wrap

1. Locate the vault (the folder with `AGENTS.md` and `index.md`, or the path in the user's global instructions).
2. Create `sessions/YYYY-MM-DD-<short-topic>.md` from `templates/session-note.md`. Fill in:
   - **Goal**, **What we did**
   - **Decisions (and why)**: the most valuable part. Always record the reason
   - **What we learned**, **Open questions**, **Next steps** (as checkboxes)
   - **Pages touched**
   Keep it short: a future session should be able to read it in 30 seconds.
3. Move durable knowledge into the wiki: update the relevant wiki pages with new decisions and learnings, citing the session note.
4. Add the session to "Recent sessions" in `index.md`, and append a `session` entry to `log.md`.
5. Show the user the note's path and the 3 most important lines.

Don't record secrets, and don't record sensitive personal details unless the user explicitly asks you to.
