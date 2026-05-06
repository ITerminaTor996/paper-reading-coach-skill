# Paper Reading Coach Skill

An interactive Codex skill for reading academic papers section by section.

Instead of summarizing first by default, the assistant creates bounded reading
gates, waits for the reader to finish, asks targeted Socratic questions, grades
the answers, gives scaffolded hints, repairs misunderstandings, and keeps a
compact model of weak points to revisit later.

It supports:

- Dynamic question volume by difficulty and section density.
- Fallback chunking when PDF headings are missing or garbled.
- Figure, table, equation, and algorithm checkpoints.
- Reviewer-style critique through `/critique`.
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
