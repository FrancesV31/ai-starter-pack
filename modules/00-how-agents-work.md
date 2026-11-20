# 00 — How AI agents actually work

⏱ 15 min · No install · [← Back to README](../README.md) · [Next: Install your agent →](01-install-your-agent.md)

## Why it matters

Every "trick" in this course (memory files, skills, subagents) is a workaround for **one limitation** of AI models. Understand that limitation and the rest of the course will make sense on its own.

## The concept

### 1. The model only predicts text

An LLM (Claude, GPT, Gemini…) does one thing: given some text, it predicts what text comes next. It does it extremely well, well enough to reason, write and plan, but it has no hands and no memory of its own.

### 2. The context window is its only memory

Everything the model "knows" about your situation is what's in front of it right now: the **context window**. Think of it as a whiteboard:

- Your messages, its replies, every file it reads and every tool result get written on the whiteboard.
- The whiteboard has a size limit (measured in tokens, ≈ ¾ of a word each).
- **When the session ends, the whiteboard is wiped.** Next session, the model knows nothing about you again.
- As the whiteboard fills up, quality drops: the model has more to sift through and gets "distracted".

> 💡 This one fact explains why AI "forgets", why long chats get worse, and why this course exists.

### 3. An agent = a model + a harness + a loop

A chat app lets the model *talk*. An **agent** lets it *act*. The program that makes this possible is the **harness** (Claude Code, Goose):

```
   ┌─────────────── the agent loop ───────────────┐
   │                                              │
   ▼                                              │
 THINK  ──►  ACT (use a tool)  ──►  OBSERVE the result
 "I should      read a file,          "the file says…"
  read the      run a command,
  notes file"   search the web
```

The harness gives the model **tools** (read file, write file, run command, browse), runs the loop, and asks your permission before risky actions.

**Model = brain. Harness = body.** You can put different brains in the same body (Goose lets you choose any model), or use a body built for one brain (Claude Code).

### 4. So where does "memory" come from?

If the whiteboard is wiped every time, persistence has to live **outside the model, in files**:

| Layer | Lives in | Lasts | Module |
|---|---|---|---|
| Working memory | The context window | One session | — |
| Standing instructions | `CLAUDE.md` / `AGENTS.md` | Forever, read every session | [02](02-standing-instructions.md) |
| Long-term knowledge | Your Obsidian vault | Forever, read when relevant | [03](03-persistent-memory.md) |
| Know-how | Skills (`SKILL.md`) | Forever, loaded when relevant | [04](04-skills.md) |

And because the whiteboard is small, the smart move for big jobs is to **give pieces of work to helpers with their own fresh whiteboards**. Those are subagents ([06](06-subagents-and-orchestration.md)).

## Try it (5 min, in any AI chat)

1. Open a new chat in Claude.ai, ChatGPT or similar. Tell it: *"My favourite fruit is mango. Remember that."*
2. Open a **second, new** chat. Ask: *"What's my favourite fruit?"*
3. Notice it doesn't know, or that it only knows because the app has a memory feature, which is itself just text quietly added to the context.

## Check you got it

- [ ] I can explain why an AI forgets between sessions (the context window is wiped).
- [ ] I can explain the difference between a model and a harness.
- [ ] I can guess where persistent memory must live (in files the agent reads).

## How it connects

Everything from here is about **deciding what goes on the whiteboard, and when**: instructions at the start (02), knowledge pulled in when relevant (03), workflows loaded on demand (04), outside data fetched through connectors (05), and big jobs split across many whiteboards (06).

## Go deeper

- [Anthropic — Building effective agents](https://www.anthropic.com/engineering/building-effective-agents)
- [Claude Code best practices](https://code.claude.com/docs/en/best-practices): the whole guide is built around managing the context window.
