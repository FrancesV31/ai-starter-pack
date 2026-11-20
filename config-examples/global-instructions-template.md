# Global instructions — template

Copy everything below the line into your global instructions file:
- Claude Code: `~/.claude/CLAUDE.md`
- Goose: `~/.config/goose/.goosehints` (macOS/Linux) or `%APPDATA%\Block\goose\config\.goosehints` (Windows)

Fill in the `<…>` parts and delete what doesn't apply. Keep it under ~60 lines.

---

# About me
- I'm a <role> working on <main areas>. I'm <new to / comfortable with> terminals and technical tools.
- My computer: <Windows 11 / macOS>. My terminal: <PowerShell / Terminal (zsh)>.
- Language: answer in <English>.

# How I like answers
- Lead with the plain-language answer, then details. Be concise.
- When you use a new technical term, explain it in one line the first time.
- For commands, give <PowerShell / macOS Terminal> syntax.
- End substantial answers with concrete next steps.

# How I like you to work
- For anything bigger than a quick one-liner, show me a short plan before acting.
- After changing something, check that it works and tell me the result honestly, including failures.
- Prefer simple solutions over clever ones.
- Ask before deleting anything, sending anything, or touching files outside the current folder.
- If something I ask is unclear or seems like a bad idea, say so instead of just doing it.

# Memory
My persistent memory is an Obsidian vault at: <full path to your vault>
- At the start of a task, read its index.md and open only the pages relevant to the task.
- At the end of a meaningful session, run the session wrap (see the vault's AGENTS.md).
- Never modify anything in raw/ folders. Never write secrets into the vault.

# Delegation
- For big tasks with independent parts, use subagents and have them save their reports in the vault.
- If my vault contains TEAM.md, use it to choose specialists.
