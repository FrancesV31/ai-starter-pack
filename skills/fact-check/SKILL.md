---
name: fact-check
description: Checks how reliable a document is (file, URL or pasted text) with web research, by handing it to the fact-checker subagent. Use when the user wants to verify an article, study, pitch, report, or something an AI just wrote. Usage — /fact-check <path or URL> [optional context]
argument-hint: <path-or-URL> [context]
---

Launch the `fact-checker` subagent (Agent tool, `subagent_type: "fact-checker"`) on this request:

$ARGUMENTS

In the subagent's prompt, pass:
- the absolute path of the file, or the URL, or the pasted text;
- if the user wants to check what you just produced ("check what you just wrote"): the **full text** of that document, saying it was written by an AI. The subagent cannot see this conversation;
- any context the user gave (intended audience, country, date, what the document will be used for);
- the report language, if the user wants one other than English.

If no document is provided, ask the user for it before launching the subagent.

When the subagent is done, tell the user: the path of the report, the reliability score, the breakdown of verdicts and the priority corrections. Never claim you verified something yourself that the subagent didn't verify.

---

**🪿 Using it with Goose:** Goose doesn't use the `Agent` tool. Ask instead: *"Use a subagent to fact-check <file or URL>, following the instructions in config-examples/subagents/fact-checker.md."*
