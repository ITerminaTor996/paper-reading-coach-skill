# Problem-Driven Skim

## Goal and scope

Help a reader unfamiliar with the paper quickly understand what problem it solves, under what conditions, how its method works, and how well its evidence supports its claims. Default to a substantial Chinese guide readable in roughly ten minutes, preserving important English terms. Adjust length to complexity and user requests; do not pad to meet a word count or promise an exact reading time.

The user is exploring and has not settled on a research direction. Do not add "对我的研究价值", a personalized research recommendation, or an assumed research agenda by default. Evaluate the paper's contents on their own terms. Do not automatically assign A/B/C reading priority; that requires the user's reading goals. A specific research-value or relevance request can enable these additions for that request.

## Inspect the paper

Use these as internal inspection steps, not gates for the user to complete:

1. Read title, abstract, and keywords for scene, problem, and core approach.
2. Read the beginning and end of the introduction for motivation, existing limitations, and claimed contributions. Distinguish the actual problem from claimed methodological novelty; scan related work for positioning when needed.
3. Inspect problem formulation, framework figures, algorithm, and essential equations. Identify inputs, outputs, modules, information flow, objectives, constraints, and assumptions.
4. Inspect experimental setup, representative results, conclusion, and stated limitations. Check environments, baselines, metrics, and the evidence for each central claim. Consult ablations when a module's role or mechanism claim depends on them.
5. Identify which claims or technical details need closer reading to assess validity or applicability.

Use available full text before making specific claims. If only an abstract or fragment is available, provide a clearly scoped preliminary guide and identify what cannot be checked; ask for missing text only where needed. Never fill gaps with plausible invented mechanisms or results.

## Write the guide

Use connected, readable prose with headings or a small table where helpful. The following are information requirements, not a rigid series of identical sections:

- Establish the concrete scene, bottleneck, and proposed solution in a short opening. Introduce unfamiliar terms in context; assume no prior knowledge of this paper.
- Explain what simpler or existing approaches struggle with, as characterized by the authors. Do not present their novelty claims as independently established facts.
- Walk through how the method actually works from input to output. Explain what each important module contributes and why the modules are connected this way. Naming algorithm families alone is insufficient. A small example can help, but label an invented example as illustrative.
- Make critical assumptions explicit and explain the consequences of relaxing them. Separate environmental knowledge, prediction, communication, sensing, and robot/model assumptions when relevant; do not force these categories onto unrelated papers.
- Report representative experimental evidence: task/environment, meaningful baselines, relevant metrics, and core findings. Use exact numbers only when verified with their conditions. Distinguish performance evidence, mechanism evidence, formal guarantees, simulation, and hardware validation.
- Explain limitations fairly: separate author-stated limitations from reader inferences and untested conditions. Missing evaluation does not by itself prove failure. A candidate question is not an established research gap or a novel contribution.
- Add a few reliable original-paper anchors such as section, figure, table, or theorem references so the reader can check the key points. Do not fabricate location references.
- Close with a short assessment of what the paper establishes and what remains to verify, plus specific original-paper locations to inspect if useful. Do not substitute publication venue for technical judgment.

Skip dense derivations, implementation constants, and secondary results unless needed for the main argument. For formal methods or constrained planning, preserve the objective/specification, guarantee scope, feasibility assumptions, and abstraction/model conditions even when proof details are deferred. Explain only the formulas necessary to understand the mechanism or boundary.

## Compact record and interaction

End the initial guide with a compact five-field record: 场景 (Scene), 核心问题 (Problem), 关键假设 (Assumptions), 核心方法 (Method), 潜在局限 (Limitations). Keep it short enough for later comparison; omit the personal Research Value field by default. Do not repeat the full guide in this card.

Default to zero or one focused question after the guide. Do not ask the user to report section completion, answer a battery of questions, or approve reading each section. When the user later restates understanding or critiques evidence, retain the main skill's one-question node calibration.

A skim request or "略读完了 / 总结一下 / 下一篇" within skim mode does not automatically trigger the deep-reading final exam or three to five recall questions. Close concisely with unresolved checks and at most one question. If the user explicitly requests a test, deeper reading, personalized relevance, or file-based closure, honor that request using the corresponding workflow.
