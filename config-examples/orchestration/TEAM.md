# TEAM.md — agent team roster (orchestration)

This roster is based on a team that has actually been used to build a real web product: one orchestrator, six specialists on different models, a QA gate and a test-the-product loop. Copy it into your vault and adapt it. A non-software version is at the end.

Point your agent to it in your instructions: *"When a task is big, read TEAM.md and act as the orchestrator."*

---

## 1. The orchestrator

The orchestrator is the main agent (Goose, Claude Code), or you. It never does the specialists' work itself. Its job:

1. **Plan:** read the project's context and current state, define what "done" means (acceptance criteria), split the work into slices.
2. **Dispatch:** send each slice to the right specialist with a complete brief (section 4).
3. **Gate:** check every result against its acceptance criteria and **reject anything without evidence** (section 5).
4. **Dogfood:** have the result tested as a real user would (section 6).
5. **Record:** have outcomes and decisions saved to the memory vault.

## 2. The specialists

Each specialist is a role file (its instructions) plus the shared [CULTURE.md](CULTURE.md). They run on **different models**: cheap and fast where the work is simple, strong where quality matters most.

| Specialist | Role | Example model choice | Why that choice |
|---|---|---|---|
| **pm** | Scopes features, writes specs, splits work into slices, defines acceptance criteria | Fast, cheap model (e.g. DeepSeek V4 Flash) | Lots of reading and structuring, little hard reasoning |
| **backend** | Data, business logic, APIs | Mid-size coding model (e.g. Qwen3.6-35B) | Solid code at low cost |
| **frontend** | Screens, components, charts | Strong coding model (e.g. GLM-5.2) | UI work fails visibly, so quality pays |
| **uiux** | Design system, component specs, visual review at several screen sizes | Multimodal model (e.g. Gemma 4) | Needs to look at screenshots |
| **devops** | Build, deployment, infrastructure | Mid-size coding model | Procedural work |
| **dogfood** | Uses the shipped product like a real user, reports structured findings with screenshots | Strong model with browser access | Judgement plus a real browser |

**On-demand library:** beyond the core six, keep a folder of extra specialist personas (architect, code reviewer, security reviewer, fact-checker…) that the orchestrator calls only when a core specialist needs depth. The [ECC](https://github.com/affaan-m/ECC) and [VoltAgent](https://github.com/VoltAgent/awesome-claude-code-subagents) libraries are good sources to adapt.

## 3. How a dispatch works

A specialist starts with an empty whiteboard. Everything it needs must be in the hand-off:

```
delegate(
  model:        "<the specialist's model>",
  context:      "<CULTURE.md> + <the specialist's role file> + <the project's AGENTS.md / context>",
  instructions: "<the slice, with its acceptance criteria and the evidence required>",
  working_dir:  "<project folder>",
  async:        true      // run in parallel; false = wait for the result
)
```

In Goose this is the `delegate` tool from the built-in Summon extension. In Claude Code, the equivalent is asking the main agent to use a named subagent ("use the frontend subagent for…").

## 4. What every brief must contain

```
Goal:          one sentence
Context:       what the specialist needs to know (it hasn't seen our conversation)
Deliverable:   what to produce, format and length
Done when:     the acceptance criteria
Evidence:      the proof required (test output, screenshots, sources)
Save to:       where results go (project folder, vault path)
Limits:        what not to do (no deleting, no sending, stay in this folder…)
```

## 5. The QA gate: proof over promises

When a specialist reports "done", the orchestrator checks:

- [ ] Is the required evidence present (test results, screenshots, sources)?
- [ ] Does the result meet **every** acceptance criterion?
- [ ] Does it contradict another specialist's work?

**Evidence missing → reject and re-dispatch** with the instruction to provide it. **Check failed →** route the findings to the right specialist. **Passed →** move on to dogfooding.

## 6. The dogfood loop

```
pm defines acceptance criteria (including what to test)
  → builder implements
  → builder checks its own work and reports the evidence
  → orchestrator verifies the QA gate
  → dogfood specialist uses the product like a real user
  → findings go back to pm for the next round of planning
```

This loop is what turns "it should work" into "a real user tried it and it worked".

## 7. Parallel or one at a time?

| Situation | Rule |
|---|---|
| Read-only work (scoping, reviews, research, testing) | ✅ Parallel |
| Writes to **different** files or folders | ✅ Parallel |
| Writes to the **same** file | ⛔ Never in parallel: one after the other |
| Work that depends on another result (screens need the data format first) | ⛔ One after the other, in dependency order |
| A shared single resource (one browser, one test account) | ⛔ One specialist at a time |

## 8. When NOT to use the team

A task under ~5 minutes of work: the orchestrator does it directly. Every dispatch costs tokens and coordination.

---

## Variant: a non-software team

The same structure works for writing, research or consulting work:

| Specialist | Role | Evidence required |
|---|---|---|
| **planner** | Turns the request into an outline and acceptance criteria | The outline + criteria |
| **researcher** (×N, parallel) | One per sub-question; sourced brief saved in the vault | Sources with links and dates |
| **writer** | Drafts from the briefs, in your voice | Draft + list of sources used |
| **fact-checker** | Checks every claim in the draft ([fact-checker.md](../subagents/fact-checker.md)) | Fact-check report and score |
| **critic** | Sceptical-reader review ([critic.md](../subagents/critic.md)) | Top 3 issues + fixes |
| **test reader** (the "dogfood") | Reads it as the real audience would and says where they got lost | List of confusing passages |

The QA gate: no draft reaches you without a fact-check report and one critic round.
