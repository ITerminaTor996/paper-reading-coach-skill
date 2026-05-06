# Paper Reading Coach Skill

An interactive Codex skill for reading academic papers section by section.

Instead of summarizing first, the assistant waits for the reader to finish a
section, asks targeted comprehension questions, grades the answers, repairs
misunderstandings, and keeps a running model of weak points to revisit later.

## Install

Copy the `paper-reading-coach/` folder into your Codex skills directory, or
install it from this repository path if your skill installer supports GitHub
repo subpaths.

## Example prompt

```text
Use $paper-reading-coach. I am reading the abstract of this paper. After I say
"done", quiz me before explaining anything.
```

## License

MIT
