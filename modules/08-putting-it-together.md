# 08 — Putting it all together

⏱ 20 min · [← Previous](07-automation.md) · [Back to README](../README.md)

## Why it matters

Each module gave you one piece. The value comes from the pieces **feeding each other**. Here is what a week looks like when everything is connected, and a checklist to find your own next step.

## A week with an agent system

| When | What happens | Pieces used |
|---|---|---|
| **Any time** | You clip interesting articles with the Web Clipper. They land in `inbox/` | Memory (03) |
| **Every morning** | "Process the inbox": yesterday's clips are ingested into the wiki and logged | Skill (04) + memory (03) |
| **Monday** | You have a new idea. You run `grill-me`, the agent interviews you until the plan is solid, then `to-spec` saves a spec in the vault | Skills (04) + memory (03) |
| **Tuesday** | "Research the 4 main alternatives." Four subagents work in parallel and each writes a sourced brief into the vault. The main agent compares them | Subagents (06) + memory (03) |
| **Wednesday** | "Draft the proposal, `/fact-check` it, then have the critic tear it apart." Generator + QA gate + critic, in a loop until the fact-check score is 8/10 or more (max 3 rounds) | Orchestration (06) + loop (07) |
| **Thursday** | "What's on my calendar this week that relates to this project?" The agent reads your calendar through a connector and links meetings to project notes | Connectors (05) + memory (03) |
| **End of every session** | "Wrap up." A session note records decisions and next steps | Memory (03) |
| **Friday** | Vault lint in a loop: "lint, fix the safe issues, repeat until clean, max 3 rounds". Once it's reliable, schedule it (optional) | Automation (07) |
| **Bigger projects** | The orchestrator runs one cycle of your improvement loop: scan → plan → build → QA gate → **your review** → reflect, with a summary saved to the vault | Team (06) + loop (07) + memory (03) |
| **Next month** | A new session already knows the idea, the research, the decisions and why they were made. **Nothing was re-explained** | All of it |

## How the pieces feed each other

```
   Connectors ──► raw sources ──► (ingest skill, scheduled) ──► wiki
                                                                │
   You ──► question ──► main agent reads index ──► relevant pages
                              │
                              ├─► delegates to subagents ──► reports saved to wiki
                              │
                              └─► session wrap ──► sessions/ ──► next session starts smarter
                                                                │
                              weekly lint (loop) ◄──────────────┘ keeps it all healthy
```

## Maturity levels — where are you?

| Level | You have | Next step |
|---|---|---|
| **1. Chatter** | You use AI chat apps | Module 01: install an agent |
| **2. Operator** | An agent and standing instructions | Module 03: build the vault |
| **3. Rememberer** | A vault the agent reads and writes; session notes | Module 04: skills for your 3 most repeated workflows |
| **4. Delegator** | Skills and subagents; reports flow into the vault | Module 06 level 3: write your TEAM.md |
| **5. Orchestrator** | A team roster with a QA gate; hooks and loops | Module 07: write your own improvement loop |
| **6. System builder** | Improvement loops that run cycle after cycle, a healthy vault, maybe schedules | Write your own skills and share them; review and prune monthly |

## Habits that keep the system healthy

1. **Plan before you build.** Ask for a plan, read it, then let it act.
2. **Verify, don't trust.** Ask "how do you know?" and check sources. Agents are confident even when they're wrong.
3. **Correct the rules, not just the output.** When the agent makes the same mistake twice, fix `AGENTS.md`, a skill or your instructions.
4. **Keep the whiteboard clean.** Start new sessions for new tasks. Long, messy sessions get worse.
5. **Prune monthly.** Remove skills, connectors and scheduled jobs you don't use.
6. **Own your memory.** Back up the vault. It's the most valuable thing you're building, and it works with whatever agent comes next.

## Your next actions

- [ ] Pick your level in the table above and do its next step this week.
- [ ] Choose **one** workflow you repeat weekly and turn it into a skill.
- [ ] Fact-check the next important document an agent writes for you.
- [ ] Run the vault lint as a loop, and read its report.
- [ ] In one month, ask your agent: *"Read my session notes from the last 30 days. What patterns do you see in how I work, and what should I automate next?"*

## Go deeper

See [RESOURCES.md](../RESOURCES.md) for the full reading list. Start with Karpathy's LLM Wiki note and Anthropic's *Building effective agents*.
