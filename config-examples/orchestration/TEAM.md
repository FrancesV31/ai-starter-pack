# TEAM.md — my agent team (orchestration roster)

Put this file in your vault and adapt it. Point your global instructions to it: *"When a task is big, read TEAM.md and dispatch to the right specialists."* The main agent then acts as the **orchestrator**.

## The orchestrator's job

1. **Plan:** restate the goal, define what "done" looks like (acceptance criteria), and split the work into slices.
2. **Dispatch:** give each slice to the right specialist, with a complete brief (see below).
3. **Review:** check each result against the acceptance criteria. Send it back if it falls short.
4. **Record:** have results saved in the vault (directly, or via the note-keeper).
5. **Report:** tell me what was done, what was checked, and what's still open.

## The specialists

| Specialist | Handles | Tools / limits | Model |
|---|---|---|---|
| **researcher** | Web research, comparisons, fact-finding | Read + web, writes only to the vault | Standard |
| **critic** | Stress-testing drafts, plans, decisions | Read-only | Strongest available |
| **note-keeper** | Filing results into the vault | Read/write in the vault only | Cheapest |
| *writer* (add your own) | *Drafting documents in my voice* | *…* | *…* |
| *analyst* (add your own) | *Spreadsheets, numbers, charts* | *…* | *…* |

## Routing rules

- A question with several independent parts → **fan-out**: one researcher per part, in parallel.
- Any draft that will be shared with other people → **generator + critic**: at least one critic round before it reaches me.
- Anything we decide → **note-keeper** records the decision *and the reason*.
- A small task (under ~5 minutes of work) → no delegation; the orchestrator does it directly.

## What every brief must contain

```
Goal:          one sentence
Context:       what the specialist needs to know (it hasn't seen our conversation)
Deliverable:   format and length
Done when:     the acceptance criteria
Save to:       vault path (if any)
Limits:        what not to do (no sending, no deleting, stay in this folder…)
```

## Review checklist (orchestrator)

- [ ] Does the result meet every acceptance criterion?
- [ ] Are claims sourced? Did anyone invent sources?
- [ ] Do the specialists' results contradict each other? If so, flag it, don't hide it.
- [ ] Is the result saved in the vault and logged?
