# Intent Authoring — Self-Drafted Routing, with Peer Review

How each squad character produces its own **intent file** (`pintent.md` in the
character layout — "what triggers me, my intent, my skill URLs") safely.

> Verified against Hermes' delegation model
> ([Subagent Delegation](https://hermes-agent.nousresearch.com/docs/user-guide/features/delegation),
> [Delegation Patterns](https://hermes-agent.nousresearch.com/docs/guides/delegation-patterns)).

## Why this is safe (the land-grab question, answered)

Hermes delegates with `delegate_task(goal, context, toolsets)`. The **orchestrator**
(DIME/Hermes) writes the goal, the context, and picks the toolset. A spawned
character:

- starts with **zero context** — "subagents know nothing"; fresh conversation,
- gets only the **toolsets the orchestrator hands it**,
- **cannot** call `delegate_task`, `clarify`, `memory`, `send_message`, or
  `execute_code` (leaf subagents),
- runs **flat** (depth 1 by default — no runaway spawning),
- returns **only a final summary**.

So a character has **no mechanism to grab work, claim scope, talk back, or message
anyone.** It does the one goal it's handed and ends. All routing authority lives
with the orchestrator. A greedy `pintent.md` can at worst create *ambiguity* DIME
resolves — never a seizure. That's why self-authored intent is safe here: the
platform structurally forbids the failure mode.

## What the intent file is (it feeds the profile `description`)

In the profiles/Kanban model (see `docs/squad-topology.md`), routing is by a
profile's **`description`** — the decomposer assigns tasks to profiles by matching
their descriptions. So `pintent.md` is the **human-readable source for that
description**: it's where we curate the agent's triggers/ownership/hand-offs, and
the profile `description` is the distilled routing key generated from it.

Hermes even has a native "derive, don't invent" command:
`hermes profile describe <name> --auto` LLM-generates the description **from the
profile's installed skills**. That *is* step 1–2 of our process, built in.

```yaml
# pintent.md  (frontmatter the orchestrator can parse, prose below it)
---
agent: LEMMY
domain: metal & music history
owns: [heavy-metal history, subgenre lineage, band canon]
triggers:            # every trigger MUST map to a skill below (no orphan triggers)
  - "thrash / Big Four / Bay Area"
  - "what subgenre is …"
  - "NWOBHM / Sabbath / metal origins"
not_me:              # explicit hand-offs — where it should go instead
  - mixing/mastering -> EDDIE
  - live soundcheck -> SLASH
skills: [thrash, metal-foundations, subgenre-map, nwobhm, sabbath]
toolsets: [web]      # Hermes toolsets this persona needs when delegated
handoffs: [EDDIE, SLASH, GIGGUIDE]   # bordering agents
---
One short paragraph: who this agent is for, in plain language.
```

## The repeatable process

```
derive → self-draft → peer review → de-conflict → approve → live → learn
```

1. **Derive, don't invent.** The draft is generated **from the agent's own
   `skills/` folder** — its source truth. Rule: **every trigger maps to a skill**.
   A trigger with no backing skill is rejected. (`hermes profile describe --auto`
   does exactly this — generates the description from installed skills.)
2. **Self-draft (delegated, parallel).** Each character drafts its own `pintent.md`
   from its `soul.md` + skill list — either via `hermes profile describe --auto`
   per profile, or a `delegate_task`/Kanban fan-out. Output: a `pintent.md`
   proposal and its distilled `description`. Characters draft **in parallel**
   (the same fan-out that generated the 80 skills).
3. **Peer review (delegated, adversarial, border-specific).** Each draft is
   reviewed by **1–2 bordering agents** (its `handoffs`), checking for:
   - **overlap** — does this claim a trigger a neighbour owns?
   - **over-claim** — triggers broader than the skills justify?
   - **gaps** — a skill with no trigger pointing at it?
   Reviewers **flag only** — they cannot approve their own or each other's
   (no rubber-stamp, and structurally they can't grab anyway).
4. **De-conflict (orchestrator).** DIME (the `orchestrator_profile`) holds the
   **master routing view** — the set of profile descriptions — resolves overlaps,
   and confirms full coverage with no gaps. The decomposer routes by these
   descriptions, so de-conflicting them *is* tuning the router.
5. **Approve (double-HITL / reveal-gate).** A `pintent.md`/description is a
   **proposal** until a human signs off. `reveal-gate` keeps the agent blocked
   until `status: live`; an unapproved profile simply isn't assignable.
6. **Learn (HIVE loop).** Routing misfires (wrong profile assigned) surface as
   Kanban comments / re-assignments, land in `hive/5-feedback-loops/` → become
   rules → sharpen each `description` next round. Intent compounds; it's never
   "done."

## No-orphan-trigger check (the anti-land-grab guard, in code terms)

For each `pintent.md`: `set(triggers' backing skills) ⊆ set(agent's skills)`.
Any trigger whose claimed skill isn't in the agent's `skills/` folder fails review.
This is what stops "I handle everything" — you can only claim what you can do.

## Note: who writes to the HIVE

It depends on the primitive:

- **Kanban profiles** are full processes with their own memory — they **can**
  persist (their own memory + comments on the board). This is the normal squad
  path, and it's how "what one learns, all learn" works: shared workspace + board.
- **`delegate_task` leaf subagents** **cannot** write to shared memory (Hermes
  blocks the `memory` toolset for them). When a character uses delegation for grunt
  work, those ephemeral workers **produce** but don't persist; the parent profile
  (or the `hive-loop` host hooks) captures after synthesis.

Design HIVE capture to live with **persistent profiles, the board, and host hooks**
— not with ephemeral subagents.
