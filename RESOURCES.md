# Resources — the reading list

Curated, not exhaustive. ⭐ = read this one first. For **tools** (other agents, terminals, plugins, models), see [TOOLBOX.md](TOOLBOX.md). For the ECC library, see the [ECC guide](guides/ecc.md).

## Understanding agents

- ⭐ **Anthropic — Building effective agents.** The clearest explanation of workflows vs agents and the five basic orchestration patterns. Short and framework-free.
  https://www.anthropic.com/engineering/building-effective-agents
- **Claude Code — Best practices (official docs).** Context management, planning first, verification, parallel sessions. Useful even if you use Goose.
  https://code.claude.com/docs/en/best-practices
- **Goose documentation.** Install, providers, recipes, subagents, scheduling.
  https://goose-docs.ai
- **Goose — supported providers.** Which models you can plug in, and how.
  https://goose-docs.ai/docs/getting-started/providers
- **Hermes Agent — documentation.** A popular open-source personal agent that keeps a memory of you and writes its own skills: a good look at where "memory + skills" goes next.
  https://hermes-agent.nousresearch.com/docs
- **The author's setup.** How all the pieces of this course fit together in one real stack: [MY-SETUP.md](MY-SETUP.md)

## Persistent memory & Obsidian

- ⭐ **Andrej Karpathy — "LLM Wiki" idea file.** The pattern this course's memory vault is built on: raw sources → AI-maintained wiki → index and log. *"Obsidian is the IDE, the LLM is the programmer, the wiki is the codebase."*
  https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
- **Obsidian — download.** Free, local, plain Markdown files.
  https://obsidian.md
- **Obsidian Web Clipper (official).** Save any web page as clean Markdown straight into your vault. Use the links on this page: look-alike extensions exist.
  https://obsidian.md/help/web-clipper
- **Community implementations of the LLM Wiki.** See how others structured theirs.
  https://github.com/balukosuri/llm-wiki-karpathy

## Skills

- ⭐ **Matt Pocock — skills.** Small, sharp, battle-tested skills: `grill-me` (get interviewed about your plan until it's solid), `to-spec`, `to-tickets`, `tdd`, `handoff`, `teach`… The best first skills library.
  https://github.com/mattpocock/skills
- **ECC (Everything Claude Code).** A very large library of agents, skills, hooks and rules. Powerful but heavy: explore it once you're comfortable, and install only from the official repo.
  https://github.com/affaan-m/ECC
- **Agent Skills open standard.** Why a skill written once works in Claude, Goose, Cursor, Copilot and more.
  https://agentskills.io
- **Anthropic — Equipping agents for the real world with Agent Skills.** How and why skills work (progressive disclosure).
  https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills

## Subagents

- **Anthropic — skills.** Official example skills (documents, spreadsheets, presentations, design and more): good models for writing your own.
  https://github.com/anthropics/skills
- **VoltAgent — awesome Claude Code subagents.** 100+ ready-made specialist subagents (research, product, business, engineering). Good for reading how others write agent roles.
  https://github.com/VoltAgent/awesome-claude-code-subagents
- **Claude Code — subagents (docs).**
  https://code.claude.com/docs/en/sub-agents
- **Goose — subagents (docs).**
  https://goose-docs.ai/docs/guides/context-engineering/subagents

## Automation

- **Claude Code — headless mode (docs).** Running Claude from a script or a schedule.
  https://code.claude.com/docs/en/headless
- **Ralph loop plugin (official Claude Code plugins).** Keeps an agent iterating on one task until a stated finish line. Find it with `/plugin` in Claude Code.
  https://github.com/anthropics/claude-plugins-official
- **Claude Code — hooks guide (docs).**
  https://code.claude.com/docs/en/hooks-guide
- **Goose — recipes (docs).**
  https://goose-docs.ai/docs/guides/recipes/session-recipes

## Connectors (MCP)

- ⭐ **MCP — official introduction.** What the Model Context Protocol is, from the people who maintain it.
  https://modelcontextprotocol.io/introduction
- **Official MCP Registry.** The neutral catalogue of published MCP servers.
  https://registry.modelcontextprotocol.io
- **Claude connectors directory.** 1,000+ connectors and plugins, one click to add in Claude.
  https://claude.com/connectors
- **Goose extensions directory.**
  https://goose-docs.ai/extensions
- **Claude Code — managing costs (docs).** Includes how to see what fills your context window (`/context`).
  https://code.claude.com/docs/en/costs
- **Claude Code — MCP (docs).**
  https://code.claude.com/docs/en/mcp
- **Goose — using extensions (docs).**
  https://goose-docs.ai/docs/getting-started/using-extensions
