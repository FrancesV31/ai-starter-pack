# 01 — Install your agent

⏱ 30 min · [← Previous](00-how-agents-work.md) · [Next: Standing instructions →](02-standing-instructions.md)

## Why it matters

A chat app can only talk. An agent can read your documents, write files, organise folders and run tasks. That's what makes memory, skills and automation possible.

## Step 0 — Meet the terminal (5 min)

A **terminal** is a window where you type commands instead of clicking. You'll only need a handful.

| | Windows | macOS |
|---|---|---|
| Open it | Start menu → type **PowerShell** → Enter | Spotlight (⌘ Space) → type **Terminal** → Enter |
| See where you are | `pwd` | `pwd` |
| List files here | `ls` | `ls` |
| Go into a folder | `cd Documents` | `cd Documents` |
| Go up one folder | `cd ..` | `cd ..` |
| Make a folder | `mkdir ai-workspace` | `mkdir ai-workspace` |

Tip: you can paste into a terminal with **Ctrl+V** (Windows) or **⌘V** (Mac). Press **Enter** to run.

Create your practice folder now:

```powershell
cd ~
mkdir ai-workspace
cd ai-workspace
```

(`~` means "my home folder" on both systems.)

---

## 🟣 Path A — Claude Code

**Requires** a Claude Pro, Max, Team or Enterprise plan, or an Anthropic Console (API) account. The free plan doesn't include Claude Code.

### Option 1 — the desktop app (easiest)

1. Download the Claude desktop app from https://claude.ai/download and sign in.
2. Open the **Code** tab, and choose your `ai-workspace` folder as the working folder.

### Option 2 — the command line

**Windows (PowerShell):**
```powershell
irm https://claude.ai/install.ps1 | iex
```
*What this is: `irm` downloads the official install script and `iex` runs it.*

**macOS (Terminal):**
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

Then close and reopen the terminal, and check it worked:
```powershell
claude --version
```

Start it **from inside your practice folder** (the agent works in the folder you start it from):
```powershell
cd ~/ai-workspace
claude
```
The first time, it opens a browser window so you can log in.

Useful to know: `claude doctor` diagnoses install problems. Type `/help` inside Claude Code to see commands, and `/exit` to quit.

---

## 🪿 Path B — Goose (any model)

### 1. Install the desktop app

- **Windows:** download and run https://github.com/aaif-goose/goose/releases/download/stable/Goose-win32-x64-setup.exe (no admin rights needed).
- **macOS:** download https://github.com/aaif-goose/goose/releases/download/stable/Goose.zip (Apple Silicon) or `Goose_intel_mac.zip` (Intel), unzip, and drag Goose to Applications. Or, if you use Homebrew: `brew install --cask block-goose`.

### 2. (Optional, needed for module 07) Install the Goose CLI

**macOS:**
```bash
curl -fsSL https://github.com/aaif-goose/goose/releases/download/stable/download_cli.sh | bash
```

**Windows (PowerShell):**
```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/aaif-goose/goose/main/download_cli.ps1" -OutFile "download_cli.ps1"
.\download_cli.ps1
```
If `goose` isn't found afterwards, its folder (`~/.local/bin`) isn't on your PATH yet. *What this is: PATH is the list of folders the terminal searches for programs.* Close and reopen the terminal first; if it still fails, see the [Goose install docs](https://goose-docs.ai/docs/getting-started/installation).

### 3. Choose a model provider

This is the big Goose advantage: you choose the brain. In the desktop app go to **Settings → Models → Configure providers**. In the CLI, run `goose configure` → **Configure Providers**.

| If you… | Choose | Cost |
|---|---|---|
| want the best quality per dollar | **Anthropic** (Claude via API key) or **OpenAI** | Pay per use. A few dollars covers this course |
| want many models with one key | **OpenRouter** | Pay per use |
| want a European provider | **Mistral** | Pay per use |
| want free and private | **Ollama** (local model on your machine) | Free. Needs a recent computer; smaller models are less capable |

> 🔑 **API keys are like credit-card numbers.** Paste them only into the app's settings, never into a chat or a document. Set a monthly spending limit in your provider's dashboard.

> ℹ️ **Can Goose use Claude?** Yes, with an **Anthropic API key**, **paid per token**. A Claude Pro/Max subscription does **not** cover it: the subscription pays for the Claude apps and Claude Code, while Goose talks to the paid-per-use API. If Claude is what you want and you already have a subscription, the Claude path is the cheaper choice.
>
> *Advanced, not tested for this course:* Goose documents a "Claude Code" adapter (ACP provider) that runs Claude Code underneath. It needs an extra Node.js install. See the [Goose ACP providers guide](https://goose-docs.ai/docs/guides/acp-providers) if you want to experiment.

### 4. Point Goose at your practice folder

In the desktop app, choose `ai-workspace` as the working directory when you start a session. In the CLI: `cd ~/ai-workspace`, then `goose session`.

---

## Permissions: the most important habit

Agents ask before doing risky things ("Can I run this command?", "Can I edit this file?"). **Read what it wants to do before you approve.**

- ✅ Approve freely: reading files in your project folder, creating notes.
- ⚠️ Think first: deleting files, running commands you don't understand, anything touching folders outside your project.
- ⛔ Never approve: sending emails or messages, purchases, entering passwords. Do those yourself.

Start with the default (ask-every-time) mode. You'll loosen it once you trust your setup.

## Try it (5 min)

In your agent, inside `ai-workspace`, type:

> Create a file called `hello.md` with three bullet points explaining what you, an AI agent, can do that a chatbot can't. Then list the files in this folder.

Watch the loop from module 00: it **thinks**, **acts** (writes a file, maybe asking your permission), **observes** (lists the folder), and reports back. Open `hello.md` in Notepad or TextEdit to see it's a real file.

## Check you got it

- [ ] `claude --version` or the Goose app works.
- [ ] I started the agent *inside* a folder and it created a real file there.
- [ ] I know what I should never approve.

## How it connects

The agent works **in a folder**. In module 03, that folder becomes your memory vault. In module 02, you'll give it a file to read at the start of every session.

## Go deeper

- [Claude Code setup docs](https://code.claude.com/docs/en/setup)
- [Goose installation](https://goose-docs.ai/docs/getting-started/installation) · [Goose providers](https://goose-docs.ai/docs/getting-started/providers)
