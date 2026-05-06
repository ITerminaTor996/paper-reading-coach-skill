# Paper Reading Coach Skill

An interactive Codex skill for reading academic papers through both direct Q&A
and section-by-section coaching.

In ask mode, the assistant answers paper questions directly while separating
what the paper says, what is inferred, and what background knowledge is being
added. In coach mode, it creates bounded reading gates, waits for the reader to
finish, asks targeted Socratic questions, grades the answers, gives scaffolded
hints, repairs misunderstandings, and keeps a compact model of weak points to
revisit later.

It supports:

- `/ask` for evidence-grounded paper Q&A.
- `/coach` for test-first guided reading.
- Dynamic question volume by difficulty and section density.
- Fallback chunking when PDF headings are missing or garbled.
- Figure, table, equation, and algorithm checkpoints.
- Reviewer-style critique through `/critique`.
- Synthesis through `/synthesis`.
- Pause/resume checkpoints through `/save`.

## Install

Copy the `paper-reading-coach/` folder into your Codex skills directory, or
install it from this repository path if your skill installer supports GitHub
repo subpaths.

## Example prompts

```text
Use $paper-reading-coach. I am reading the abstract of this paper. After I say
"done", quiz me before explaining anything.
```

```text
Use $paper-reading-coach in /ask mode. What does Equation 4 mean, and how is it
used by the method?
```

```text
Use $paper-reading-coach in rigorous mode. Help me understand the method section
well enough to implement it.
```

```text
Use $paper-reading-coach. The PDF section headings are messy, so chunk the paper
into a reading route first.
```

```text
Use $paper-reading-coach. I uploaded Figure 3. Ask me what it shows, then help
me analyze axes, trends, anomalies, and whether the claim is overgeneralized.
```

## License

MIT
