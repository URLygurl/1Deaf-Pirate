# HIVE Architecture — Reconciled (source of truth)

> Reconciles the `hivemind.html` 5-layer design with what's actually native to
> Hermes + GBrain. Where they differ, **this doc wins**; `world/hivemind.html` is
> kept as the visual/world asset, not the build spec.
> Full review + rationale: the plan that produced this; decision logged in
> `architecture.md`.

## The headline

The `hivemind.html` design is **right** — it's just **already implemented** by
native parts. We don't hand-build a memory store, event bus, or P2P layer. We wire
proven components:

| hivemind.html layer | Built with | Notes |
| --- | --- | --- |
| **L1 Shared Memory Store** | **GBrain** (MCP, self-hosted) | synthesis + knowledge graph + gap analysis + per-login scoping. Not a raw Redis KV. |
| **L2 Agentic Event Bus** | **Hermes Kanban** (`task_events`) + `hive-loop` hooks | durable typed events; agents subscribe by lane/assignee. |
| **L3 DIME Orchestrator + kill switch** | DIME = `orchestrator_profile`; `failsafes.md` | DIME decides all responsive actions. |
| **L4 Persistent Identities** | **Hermes profiles** | one profile per character — own SOUL, skills, memory, model. |
| **L5 P2P Bilateral Channels** | **Hermes Kanban** (any profile reads/writes any task; comments) | comments = the inter-agent protocol; audit built in. |
| NEIL bidirectional public layer | NEIL profile + gateway + Kanban | always-on FOH; reads/writes hive; DIME decides actions. |
| `brain.md` (shared identity) | `agents/*/brain.md` | read **before** soul/skills. Verbatim, shared by all 15. |

**Do NOT build:** custom Redis/Upstash KV, bespoke pub/sub, custom P2P routing.
Kanban + GBrain already provide L1/L2/L5 — durably, securely, and tested.

## The roster (15) + departments

Departments come from `hivemind.html` and map onto **Kanban lanes** for routing.

| Dept | Agents | Build status |
| --- | --- | --- |
| Creative | **DIME** (orchestrator), **LEMMY** (A&R / genre vault) | DIME: no skills (orchestrates); LEMMY ✅ |
| Studio | **EDDIE** (producer/engineer), **GEDDY** (acoustician) | ✅ ✅ |
| Live | **SLASH** (live eng), **HALFORD** (lighting), **HETFIELD** (tour mgr) | ✅ ✅ ✅ |
| Business | **GENE** (royalties/biz) | ✅ |
| Campaign | **NIKKI** (release strategy), **GIGGUIDE** (NZ streetzine) | ✅ ✅ |
| Trades | **ANGUS** (builder/R-value), **RANDY** (cabs/Thiele-Small), **DIO** (stage elec), **OZZY** (roadie/fixer) | ⚠️ ANGUS skills pending; RANDY ✅ DIO ✅ OZZY ✅ |
| Front of House | **NEIL** (bidirectional public) | ✅ |

**Gap:** ANGUS is the real 15th agent (only an example before) — his `skills/` are
pending (`agents/open/ANGUS/skills/_PENDING.md`). Everything else has skills built.

Model tiers (from the design, supported per-profile in Hermes): opus-4 for
DIME/EDDIE/HETFIELD; haiku-4 for GIGGUIDE/DIO/OZZY; sonnet-4 for the rest.

## Non-negotiable: the double-lock holds over the propagation demo

`brain.md`: *"Real-world actions — sending, posting, paying, booking, contacting
anyone — wait for Cory's explicit say-so."* The Propagation demo shows fast
cascades ending in DIME "approving a booking" with "zero human coordination."

**Reconciliation — cascades PREPARE, they never EXECUTE:**
- The fan-out (venue → routing → campaign → DIME) runs fast and **drafts** the action.
- The actual booking / post / payment / contact **stops at the double-lock** —
  enforced by `reveal-gate` (agent not live) and `hive-loop` `pre_tool_call`
  (HITL on outward tools). "Drafted" and "done" stay different words.
- Speed is for preparation. Human sign-off is for execution. Always.

## Functions we adopt from GBrain (new vs. the KV design)

- **Gap analysis** — the brain says what it *doesn't* know yet (anti-confident-lies).
- **Knowledge graph** — typed edges over venues / artists / companies / contracts /
  deals (`plays_at`, `owes`, `managed_by`, `invested_in`). Built for a music business.
- **Overnight consolidation daemon** — ingest + enrich + dedupe + fix citations while
  idle. The "wake up smarter" loop, as a daemon.
- **Cited answers / provenance** on every claim.
- **Per-login permission scoping** — maps onto `hive/4-permissions/` + trust tiers.

## How the HIVE loop maps now (operating-map.md still holds)

| Operating-map stage | Now provided by |
| --- | --- |
| Capture | `hive-loop` `post_tool_call` → GBrain ingest + Kanban events |
| Retrieval | GBrain synthesis (cited) injected via `pre_llm_call` |
| Source-Truth | GBrain citations + **gap analysis** |
| Permissions | `hive-loop` `pre_tool_call` + GBrain per-login scoping + `reveal-gate` |
| Feedback | corrections → GBrain consolidation + `hive/5-feedback-loops` |
| Execution | held at the double-lock; Kanban dispatch after sign-off |

## Open items
- Generate ANGUS's skills (same fan-out as the 80).
- Reconcile each `agents/*/agent.json` role/department to this table (low priority).
- GBrain vetting pass (`pre-launch-checklist.md`) before it goes live.
- Wiring (GBrain MCP + Kanban board + DIME orchestrator) = Roadmap Phase 2, once
  Hermes is up.
