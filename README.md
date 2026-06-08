# Paper Reading Coach

An adaptive AI-agent skill for reading academic papers, technical reports, and
research notes.

The skill is designed for a natural reading rhythm: ask questions when you are
confused, get a lightweight map before reading, switch between skimming and
deep reading, receive occasional understanding checks, and finish with an exam
or synthesis when useful.

It is written as a portable skill folder, but the core instructions can also be
pasted into many AI systems: Codex, Claude Code, other agent frameworks, or a
web-based AI chat.

## Why This Exists

Many paper tools summarize too early. Older coaching prompts can go too far in
the other direction: they turn reading into rigid section checkpoints and
quizzes.

This skill aims for the middle:

- explain direct questions first;
- use paper sections as navigation anchors, not mandatory gates;
- begin with a lightweight reading map and main questions;
- infer whether the user is skimming or deep-reading;
- ask natural follow-up questions only when they help;
- provide specific, non-flattering encouragement;
- support final exam-style review;
- produce a final synthesis that includes both paper content and the user's
  learning path.

## Reading Flow

At the start of a paper, the assistant can provide:

- a one-sentence orientation;
- three main questions the reader should answer by the end;
- an adjustable reading route;
- a quick distinction between skim and deep-read goals.

During reading, the user can ask freely about concepts, equations, figures,
methods, experiments, or whether a detail can be skipped. The assistant should
answer the current question first and only ask a natural follow-up when it
helps clarify understanding.

At the end, the user can request:

- an exam with graded repair;
- a paper summary;
- a synthesis that includes what the user understood, what they struggled
  with, and what to revisit;
- memory cards or notes for a literature review, presentation, or
  implementation plan.

## Optional Commands

Commands are optional. Natural language works too.

| Command | Purpose |
| --- | --- |
| `/skim` | Skim for main line, evidence, and limitations. |
| `/deep` | Deep-read the paper with mechanism and evidence checks. |
| `/ask` | Ask a direct paper question. |
| `/exam` | Test understanding with exam-style questions. |
| `/summary` | Summarize the current unit or produce final synthesis. |
| `/critique` | Inspect assumptions, evidence, baselines, and overclaims. |
| `/save` | Create a concise resume checkpoint. |

## Install

Copy the `paper-reading-coach/` folder into any AI agent environment that
supports skill-style instruction folders.

For Codex, copy the folder into your Codex skills directory. If your skill
installer supports GitHub repository subpaths, install the `paper-reading-coach/`
folder from this repository. Restart the agent after installation so the new
skill metadata is loaded.

## Prompt Example

```text
Use $paper-reading-coach. I am reading this paper. Start with a lightweight
reading map, then follow my questions naturally. I may skim some parts and
deep-read others. At the end, test me and produce a synthesis of both the paper
and my learning path.
```

## License

MIT
