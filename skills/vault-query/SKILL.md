---
name: vault-query
description: Answer a question from the user's Obsidian memory vault, with citations. Use when the user asks "what do we know about…", "according to my notes…", "what did we decide about…", or asks about past sessions.
---

# Vault query

1. Locate the vault (the folder with `AGENTS.md` and `index.md`, or the path in the user's global instructions).
2. Read `index.md`. Pick the most relevant pages, including recent `sessions/` notes for "what did we do/decide" questions.
3. Open those pages. Follow `[[links]]` one or two hops if needed. **Do not read the whole vault.**
4. Answer concisely. After each key point, cite the page it came from as `[[page-name]]`.
5. End with:
   - **Not covered:** what the vault doesn't know about this question.
   - **Suggested sources:** what to add to fill the gap (only if relevant).
6. If the answer is new and valuable, offer to save it as a wiki page. Don't save without a yes.

If the vault has nothing on the question, say so plainly instead of answering from general knowledge. You may add general knowledge afterwards, clearly labelled as *not from the vault*.
