---
name: strategic-design-doc
description:
  Co-author organization-level strategic design documents. Use when writing docs
  that propose structural changes, cross-cutting programs, or org-level
  initiatives affecting multiple teams or departments.
---

# Strategic Design Document Workflow

This skill provides a structured workflow for co-authoring organization-level
strategic design documents. These are documents that propose structural changes,
new processes, or cross-cutting initiatives that affect multiple teams or
departments. The workflow emphasizes deep problem understanding before solution
design, and produces documents where the scope is evident from the specificity of
the analysis, not from language that claims importance.

## When to Use This Skill

- Writing a design doc that proposes organizational or process changes
- Drafting a strategy document that spans multiple teams or departments
- Creating a proposal for a new cross-cutting program or initiative
- Documenting a structural change to how work gets done (not just what gets built)
- Writing docs that will be reviewed by engineering leadership

Do **not** use this skill for purely technical implementation docs (use the
`doc-coauthoring` skill instead), API documentation, runbooks, or how-to guides.

## Document Anatomy

Organization-level strategic docs follow a consistent structure. Not every section
applies to every doc, but this is the reference anatomy:

```
Strategic Design Document Structure:

├── Problem
│   ├── Current state pain (specific, evidence-based)
│   └── Strategic Context (why now, what org goals this enables)
├── Proposed Solution
│   ├── How It Works (architecture diagram, operational model)
│   ├── What stakeholders gain (framed per audience)
│   └── Mechanism design (governance, tiers, process details)
├── Detailed Mechanism Design
│   ├── Each major mechanism gets its own section
│   ├── Include tables for tier definitions, role breakdowns, etc.
│   └── Address edge cases inline (e.g., cross-department incidents)
├── Quality / Governance
│   ├── Standards and rubrics (published, transparent)
│   ├── Accountability model (coaching vs. gatekeeping)
│   └── Feedback loops (weekly reviews, calibration forums)
├── Rollout Plan
│   ├── Phased approach with concrete milestones
│   ├── What triggers each phase transition (evidence-based, not calendar-based)
│   └── Timeline table
├── Success Metrics
│   ├── Baseline, Target, Measurement method (table format)
│   └── Leading and lagging indicators
├── Resources Required
├── Risks & Mitigations
│   └── Table format: Risk | Mitigation
├── Industry Precedent (when it genuinely informs the design choice)
└── References
```

### Structural Principles

1. **Problem before solution.** The problem section should make the reader feel
   the pain before any solution appears. If the problem statement is weak, the
   rest of the doc cannot land.

2. **Strategic context earns the scope.** Connect the problem to organizational
   goals, revenue targets, or strategic initiatives. This is not decorative. It
   makes the doc legible to leadership and justifies the investment.

3. **Mechanism design, not hand-waving.** Don't say "departments will own their
   incidents." Explain the certification tiers, the governance model, the
   escalation paths. Specificity separates a strategy from a wish.

4. **Phased rollout with trigger criteria.** Show how this gets adopted, not just
   how it works in steady state. Phase transitions should be evidence-based, not
   calendar-based.

5. **Risks are features, not afterthoughts.** A risk section that names real
   threats (and does not list softballs) signals ownership and builds trust with
   reviewers.

6. **Every section earns its place.** No section exists because "design docs have
   this section." Each section exists because the reader needs it.

## Workflow: Five Phases

### Phase 0: Brain Dump & Decomposition

**Goal:** Get everything out of the author's head and structure it into workable
raw material.

**Process:**

1. Invite the author to dump everything: raw observations, frustrations,
   conversations, half-formed ideas, data points, links, org context, political
   dynamics. Emphasize that organization and polish are irrelevant at this stage.
   Tell them to go stream-of-consciousness. Multiple messages are fine.

2. As material arrives, silently organize it into:
   - **Themes:** What recurring patterns emerge?
   - **Tensions:** Where are the structural conflicts?
   - **Stakeholders:** Who is affected, who decides, who blocks?
   - **Evidence:** What data or incidents support the case?
   - **Constraints:** What is fixed vs. malleable?

3. When the author signals they have dumped enough (or the flow slows), present
   back a **structured context map**: a concise summary of themes, tensions,
   stakeholders, and open questions. This is not a document outline. It is a
   shared understanding of the territory.

4. Ask 5-10 clarifying questions targeting gaps in the context map. Focus on:
   - Stakeholder incentives that are not yet clear
   - Prior attempts and why they failed or stalled
   - Organizational dynamics that will shape adoption
   - Hard constraints vs. assumed constraints
   - What success looks like in concrete terms

5. Iterate until the context map feels complete to the author. Track open
   questions that remain but do not block progress.

**Exit condition:** Both author and agent agree the territory is mapped. Remaining
open questions are identified and acknowledged.

### Phase 1: Problem Framing

**Goal:** Distill the context map into a crisp problem statement and strategic
anchor.

**Process:**

1. Draft a candidate problem statement. A strong problem statement:
   - Names the specific structural dysfunction (not symptoms)
   - Shows how it compounds over time (reinforcing loops, scaling problems)
   - Connects to measurable organizational pain
   - Uses concrete evidence (incident counts, time allocations, team feedback)

2. Draft the strategic context paragraph. This connects the problem to broader
   organizational goals. It should read as natural context, not as justification
   for the doc's existence. Reference real strategic documents, annual goals, or
   leadership priorities by name.

3. Apply systems thinking to map the dynamics:
   - What feedback loops sustain the current state?
   - Where are the delays between action and consequence?
   - What leverage points exist?
   - What happens if nothing changes? (The do-nothing scenario)

4. Identify which mental models are relevant and load the corresponding skills
   silently:
   - **Adoption/behavior change** -> Load `fogg-behavior-model`
   - **Multi-party dynamics, reciprocity** -> Load `game-theory-tit-for-tat`
   - **Stakeholder buy-in, perceived risk** -> Load `trust-psychology`
   - **Cognitive burden of proposed changes** -> Load `cognitive-load`
   - **Complex dependency mapping** -> Load `graph-thinking`
   - **Root cause analysis** -> Load `five-whys`

   Apply their frameworks to deepen the analysis. Do not name the frameworks in
   the document. Let their insights shape the content naturally.

5. Present the problem framing to the author for refinement. Iterate until it
   feels sharp.

**Exit condition:** The problem statement makes the reader feel the pain. The
strategic context makes the scope feel earned, not claimed.

### Phase 2: Solution Architecture

**Goal:** Design the proposed solution through interactive brainstorming and
convergence.

**Process:**

1. Based on the problem framing, brainstorm 3-5 solution approaches. For each:
   - Core mechanism (what structurally changes)
   - What it requires from whom
   - Key tradeoffs
   - Adoption implications

2. Discuss tradeoffs with the author. Converge on a direction. If the author
   already has a strong direction, validate it against the problem framing and
   pressure-test the weak points rather than generating alternatives for their
   own sake.

3. Design the solution in detail:
   - Architecture or operational model (sketch an ASCII diagram)
   - Governance structure (who decides, who reviews, who escalates)
   - Rollout strategy (phases, triggers, pilot selection)
   - Edge cases and failure modes

4. Apply loaded mental model skills to stress-test the design:
   - Fogg: What is the ability barrier for adoption? Where is motivation weakest?
     What prompts exist (or are missing) at the right moments?
   - Tit-for-tat: What does the first defection look like? How does the system
     recover? Is the enforcement mechanism proportional?
   - Trust: What perceived risks will stakeholders have? How does the design
     reduce them? Where are the trust killers?

5. Outline the full document structure (sections and their purposes). Present to
   the author for agreement before drafting begins.

**Exit condition:** Document structure agreed. Solution architecture is clear
enough that either person could explain it to a skeptical VP.

### Phase 3: Section-by-Section Drafting

**Goal:** Build each section through the brainstorm-curate-draft cycle.

**Process:**

For each section, follow this cycle:

1. **Clarify:** Ask 3-5 questions about what this section needs to cover.
2. **Brainstorm:** Generate 5-15 points that could belong in this section.
   Include things from the context map that the author may have forgotten.
3. **Curate:** Author selects what to keep, remove, or combine. Brief
   justifications help calibrate for subsequent sections.
4. **Draft:** Write the section. Use the author's voice: direct, specific,
   concrete. Name teams, tools, metrics.
5. **Refine:** Author provides feedback. Make surgical edits via `str_replace`.
   Iterate until the section lands.

**Section ordering:** Start with the section that has the most unknowns (usually
the core solution mechanism). Work outward to governance, rollout, metrics. Save
the problem statement and summary for last, since they are easier to write once
the solution is sharp.

**Voice guidance during drafting:**

- Name specific teams, tools, metrics, people. Specificity signals ownership.
- Describe how changes propagate through the system, rather than claiming impact.
- Include governance because the solution needs it to work, not as decoration.
- Quantify where possible (incident counts, time allocations, team sizes).
- Use ASCII diagrams for architecture and operational models.
- Tables for structured comparisons (tiers, rollout phases, risk matrices).
- Callout blocks (`> [!info]`, `> [!note]`) for important context.

**Near completion (80%+ of sections done):**

Re-read the entire document and check for:

- Flow and consistency across sections
- Redundancy or contradictions
- Generic filler that does not carry specific content
- Whether every sentence carries weight

When all sections are drafted and refined, transition to Phase 4.

### Phase 4: Calibration & Polish

**Goal:** Review the complete document through two lenses and make final
refinements.

**Process:**

1. **Reader experience review.** Read the complete document as a first-time
   reader. Check:
   - Does the problem section create urgency without being alarmist?
   - Does the solution feel inevitable given the problem framing?
   - Is every section earning its place?
   - Will a VP of Eng or department lead know what to do after reading this?
   - Are there blind spots or unstated assumptions a reader would catch?
   - Does the document flow logically from section to section?

2. **Scope calibration (internal, do not surface in the document):**
   - Does the doc naturally show cross-team or cross-org thinking, or does it
     read as a team-level proposal?
   - Are the feedback loops and second-order effects visible in the analysis?
   - Does the governance model show the author thinks about sustainability, not
     just launch?
   - Is the industry context genuinely informative, or does it feel bolted on?
   - If any section reads too locally scoped, suggest how to widen the lens
     without inflating the language.

3. **Anti-pattern scan.** Flag and remove:
   - Scope-performing language ("this org-wide initiative", "cross-cutting",
     "strategic" used as filler)
   - Generic strategy prose that does not carry specific content
   - Sections that exist for appearance rather than substance
   - Adjectives that claim importance rather than demonstrating it

4. Present calibration findings to the author. Make final refinements.

5. **Reader testing** (when sub-agents are available): Invoke a fresh sub-agent
   with the document content and test whether a reader with no context can:
   - Summarize the problem in one sentence
   - Explain the proposed solution
   - Identify the key risks
   - Understand what action is being asked of them

   If the sub-agent struggles, loop back to refine the problematic sections.

**Exit condition:** The document reads as authoritative and specific. Every
section earns its place. The scope is evident from the content, not from framing
language.

## Obsidian Vault Conventions

When writing documents to the vault

### File Placement

Place documents under `Projects/<project-name>/`. If the project directory does
not exist, create it. Use the glob tool to check existing project directories
before creating a new one to avoid duplicates.

### Frontmatter

Use the following frontmatter structure:

```yaml
---
document_type:
  - design-doc
author: Cedric Specht
tags:
  - YYYY-MM-DD
  - design-document
  - strategy-document
  - <topic-tags>
created: YYYY-MM-DD
links:
  - "[[YYYY-MM-DD]]"
related_documents:
  - "[[Related Doc Name]]"
aliases:
  - Alternative Name
---
```

**Tag conventions:**

- Always include `design-document` (picked up by Design Documents MOC)
- Include `strategy-document` for org-level strategic docs (picked up by Strategy
  Documents MOC)
- Add topic-specific tags (e.g., `reliability`, `incident-management`, `slo`)
- Include the creation date as a tag in `YYYY-MM-DD` format
- Link the daily note in `links`

### Formatting

- Use Obsidian wikilinks (`[[Page Name]]`) when referencing other vault documents
- ASCII art for architecture diagrams (see IC Franchise Model for reference style)
- Tables for structured comparisons (tiers, phases, metrics, risks)
- Callout blocks (`> [!info]`, `> [!note]`, `> [!warning]`) for important context
- Horizontal rules (`---`) to separate major doc regions when needed

### Backlinks Section

Every document ends with a Backlinks section using a standard dataview query.
Include this at the bottom of every document:

````
## Backlinks

```dataview
TABLE L.text AS "Context"
FROM [[]]
FLATTEN file.lists AS L
WHERE contains(L.outlinks, [[]])
    AND file.path != "Career/Path to Fellow/0 - README.md"
SORT file.mtime desc
```
````

## Integration with Other Skills

| Skill                       | When to Load                                       | How It Helps                                              |
| --------------------------- | -------------------------------------------------- | --------------------------------------------------------- |
| **fogg-behavior-model**     | Doc involves adoption or behavior change           | Diagnose ability/motivation barriers in the adoption plan |
| **game-theory-tit-for-tat** | Multi-party dynamics or reciprocal structures      | Stress-test governance for defection, design enforcement  |
| **trust-psychology**        | Stakeholder buy-in is critical                     | Design trust signals into the rollout, address hesitation |
| **cognitive-load**          | Proposal adds cognitive burden to people           | Evaluate cognitive cost of the proposed change            |
| **graph-thinking**          | Complex dependencies across teams or systems       | Map dependency structures, find hidden coupling           |
| **five-whys**               | Problem statement needs deeper root cause analysis | Push past symptoms to structural causes                   |

Load skills silently when relevant. Apply their frameworks to deepen the analysis
without naming the frameworks in the document.

## Writing Style

- Never use em-dashes. Use commas, periods, or parentheses instead.
- Direct, specific prose. Avoid generic strategy language.
- Concrete over abstract: name teams, tools, metrics, timelines.
- Use active voice. The author owns the proposal.
- Tables and diagrams carry structured information. Prose carries narrative and
  reasoning.
- Callout blocks for important context that is not part of the main flow.
- No emojis. Not in headers, not in bullets, not anywhere.
- Never use the bolded-prefix-then-explanation bullet pattern (e.g.,
  "**Thing**: explanation of thing"). This is a dead giveaway of AI-generated
  text. If you use bullets, keep them short and uniform without bolded lead-ins.
  Use bolded terms at the start of a paragraph or in a definition list, but not
  as a label-then-explanation pattern inside bullet lists.
- Avoid LLM filler words: "comprehensive", "robust", "enhance", "streamline",
  "leverage", "seamless", "cutting-edge", "holistic", "synergy". If you catch
  yourself reaching for these, find the specific word that actually describes
  what you mean.
- Don't pad. If a section is short because the content is simple, that is fine.
  A three-sentence risk section is better than a padded one.

## Resources

- [Diataxis Framework](https://diataxis.fr/) (documentation taxonomy)
- [Thinking in Systems, Donella Meadows](https://www.chelseagreen.com/product/thinking-in-systems/)
- [The Staff Engineer's Path, Tanya Reilly](https://www.oreilly.com/library/view/the-staff-engineers/9781098118730/)
- [Design Docs at Google](https://www.industrialempathy.com/posts/design-docs-at-google/)
- [An Elegant Puzzle, Will Larson](https://lethain.com/elegant-puzzle/)
