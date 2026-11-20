---
name: vault-lint
description: Health-check the user's Obsidian memory vault and write a lint report. Use when the user says "lint the vault", "health check", "clean up my notes", or when run by a scheduled job.
---

# Vault lint

1. Locate the vault (the folder with `AGENTS.md` and `index.md`, or the path in the user's global instructions) and read `AGENTS.md`.
2. Check, and collect findings:
   - **Structure:** broken `[[links]]`; wiki pages missing from `index.md`; index entries pointing to missing pages; orphan pages (nothing links to them).
   - **Quality:** claims without a source; contradictions between pages; near-duplicate pages; pages on fast-changing topics not updated in 6+ months.
   - **Hygiene:** files in `inbox/` older than 7 days; any file in a `raw/` folder that looks modified after ingest (mention it, don't touch it); anything that looks like a secret (password, key, card or ID number): **flag it, never copy it into the report**.
3. **Fix automatically only safe, mechanical issues:** add missing index entries, repair links whose target clearly exists under a slightly different name. Never delete pages, never touch `raw/`.
4. Write the report to `sessions/YYYY-MM-DD-lint-report.md`:
   - Summary line (e.g. "3 fixed, 5 need your decision")
   - **Fixed** (what you changed)
   - **Needs a decision**, grouped by severity, each with a suggested action
5. Append a `lint` entry to `log.md` and link the report from `index.md` under Recent sessions.

When running unattended (scheduled or headless), never ask questions. Put everything that needs a decision in the report.
