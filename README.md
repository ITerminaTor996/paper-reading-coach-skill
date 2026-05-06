# 📚 Paper Reading Coach

Most AI paper tools answer your questions. This one can also question your
answers.

Paper Reading Coach is a portable AI-agent skill for reading academic papers
with two complementary workflows: direct Q&A when you need a fast explanation,
and test-first coaching when you want to make sure you actually understand the
paper.

It is written as a skill folder, but the core instructions can be used with many
AI systems: Codex, Claude Code, other agent frameworks, or a web-based AI chat
where you paste the prompt manually.

## 🧠 Why This Exists

LLMs are good at summarizing papers, but summaries can make difficult ideas feel
familiar before they are understood. This skill is designed for a different
reading rhythm:

- ask quick questions when you need help;
- read one bounded section at a time;
- carry guiding questions into the section while reading;
- get quizzed before receiving a full explanation;
- ask mid-reading questions without losing your place;
- repair misunderstandings while the paper is still fresh;
- keep track of weak points for later review.

The goal is not to replace paper-reading tools. It is to add a more active,
mentor-like layer on top of them.

## 🧭 Modes

### 💬 `/ask`

Use direct Q&A mode for quick paper questions, equation explanations, figure
interpretation, section summaries, comparisons, and terminology.

Answers are encouraged to separate:

- what the paper explicitly says;
- what is inferred from the paper;
- what background knowledge is being added;
- where the supporting evidence appears, when available.

### 🎓 `/coach`

Use coaching mode for section-by-section reading. The assistant gives a bounded
reading target, waits, asks questions, grades your answers, gives hints, and
repairs misunderstandings.

This mode is intended for deep method understanding, group meetings,
implementation, replication, exams, and serious literature review.

### 🔍 `/critique`

Use reviewer mode to examine assumptions, missing baselines, weak evidence,
hidden variables, overclaiming, and limitations.

### 🧩 `/synthesis`

Use synthesis mode after reading enough material to build a paper map,
implementation-readiness notes, literature-review positioning, or memory cards.

## ✨ Features

- 💬 Dual workflow: evidence-grounded Q&A plus active-recall coaching.
- 🎚️ Dynamic question volume based on section density and difficulty.
- 🚦 Anti-spoiler gates that stop the assistant from explaining too early.
- 🧭 Checkpoint state tracking so mid-reading Q&A does not advance the paper.
- 🧱 Fallback chunking for messy PDF text or broken section headings.
- 📊 Figure, table, equation, theorem, algorithm, and experiment checkpoints.
- 🪜 Scaffolded hints before full explanations.
- 🧾 Compact running state for weak points and evidence to revisit.
- 💾 Pause/resume support through `/save`.

## ⚡ Commands

| Command | Purpose |
| --- | --- |
| `/ask` | Switch to direct paper Q&A. |
| `/coach` | Switch to test-first reading coach mode. |
| `/switch` | Toggle between Q&A and coach mode. |
| `/done` | Mark the current unit as read and ready for checkpoint answers. |
| `/hold` | Stay on the current unit and do not advance. |
| `/hint` | Get the smallest useful hint. |
| `/summary` | Summarize the current unit. |
| `/critique` | Inspect the paper like a skeptical reviewer. |
| `/synthesis` | Build a higher-level synthesis from what has been read. |
| `/map` | Show a compact paper map. |
| `/cards` | Create review cards from tested material. |
| `/save` | Create a concise checkpoint for resuming later. |

## 🚀 Use It

### 🛠️ As A Skill

Install the `paper-reading-coach/` folder into any AI agent environment that
supports skill-style instruction folders.

For Codex, copy the folder into your Codex skills directory. If your skill
installer supports GitHub repository subpaths, install the `paper-reading-coach/`
folder from this repository. Restart the agent after installation so the new
skill metadata is loaded.

### 📝 As A Prompt

If your AI tool does not support skills, open
`paper-reading-coach/SKILL.md` and paste its contents into the conversation as
the reading protocol. Then ask the assistant to follow it while reading a paper.

This works well for web AI chats, custom GPT-like assistants, and coding agents
that accept project instructions.

## 🌱 Project Status

This skill is early and intentionally small. The current focus is prompt logic:
mode routing, active recall, grounded Q&A, and paper-reading workflow design.

Feedback from real reading sessions is welcome.

## 📄 License

MIT
