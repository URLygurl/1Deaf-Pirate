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

## What the intent file is (our convention, not Hermes-native)

Hermes has **no** built-in per-agent intent/routing schema — routing is the
orchestrator reasoning over the request plus available skills. So `pintent.md` is
**ours**: the lookup DIME consults to turn "a request about X" into a
`delegate_task` call (which persona to load, which skills, which toolsets).

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
   A trigger with no backing skill is rejected.
2. **Self-draft (delegated, parallel).** DIME spawns each character with
   `delegate_task`: goal = "draft your `pintent.md` from your skills", context =
   the agent's `soul.md` + the list of its skill names/descriptions. Output: a
   `pintent.md` proposal. Characters draft **in parallel** (this is the same
   fan-out that generated the 80 skills).
3. **Peer review (delegated, adversarial, border-specific).** Each draft is
   reviewed by **1–2 bordering agents** (its `handoffs`), checking for:
   - **overlap** — does this claim a trigger a neighbour owns?
   - **over-claim** — triggers broader than the skills justify?
   - **gaps** — a skill with no trigger pointing at it?
   Reviewers **flag only** — they cannot approve their own or each other's
   (no rubber-stamp, and structurally they can't grab anyway).
4. **De-conflict (orchestrator).** DIME holds the **master trigger table**,
   resolves overlaps, and confirms full coverage with no gaps.
5. **Approve (double-HITL / reveal-gate).** A `pintent.md` is a **proposal** until
   a human signs off. `reveal-gate` keeps the agent blocked until `status: live`.
6. **Learn (HIVE loop).** Routing misfires (wrong agent fired) land in
   `hive/5-feedback-loops/` → become rules → sharpen intent next round. Intent is
   never "done"; it compounds.

## No-orphan-trigger check (the anti-land-grab guard, in code terms)

For each `pintent.md`: `set(triggers' backing skills) ⊆ set(agent's skills)`.
Any trigger whose claimed skill isn't in the agent's `skills/` folder fails review.
This is what stops "I handle everything" — you can only claim what you can do.

## Note: who writes to the HIVE

Leaf subagents **cannot write to shared memory** (Hermes blocks the `memory`
toolset for them). So during a delegated run a character **produces** (its summary,
its draft) but does **not** persist to the HIVE itself. Persistence happens at the
**orchestrator level** — DIME (or the `hive-loop` host hooks) captures the learning
after synthesis. Design capture as an orchestrator/hook responsibility, not an
in-character write.
