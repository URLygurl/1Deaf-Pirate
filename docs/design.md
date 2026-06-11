# design.md — DefPirate / Naked Staff visual system

**The single source of truth for how every surface looks.** Dashboards, the chat board,
the studio floor, the orchestration hub, the animator, and anything the squad builds next
all conform to this. Tokens live in [`world/brand/tokens.css`](../world/brand/tokens.css) —
import or copy that block; never hand-pick hex values per file again.

> Decided with Cory (2026-06): **canonical look = navy + cyan dashboard system** (the
> floor-scaffold/hub family, the "source of truth"). **Green `#7EFF00` = live/active/success;
> cyan `#33c8ff` = info/interactive.** The Peachy/coral aesthetic is retired from product
> surfaces (it lives on only as The Peach owner-control component's own skin, if at all).

## Why this exists

Surfaces had drifted into two palettes (navy+cyan dashboards vs coral/peach/Fraunces
animator) and the brand's signature green `#7EFF00` wasn't actually used anywhere. This
file + `tokens.css` lock one system so it stops happening.

## 1. Colour — roles, not decoration

| Token | Hex | Use it for |
|------|-----|-----------|
| `--bg` | `#070b12` | app background |
| `--panel` / `--panel-2` | `#0d141f` / `#111b2a` | cards, panels (gradient base→raised) |
| `--edge` / `--edge-2` | `#1d2c40` / `#273b56` | hairlines / brighter dividers |
| `--ink` / `--mute` / `--dim` | `#dce8f5` / `#6f8198` / `#46586e` | text: primary / secondary / placeholder |
| **`--live`** | **`#7EFF00`** | **LIVE / active / success / "on the floor now" — the signature.** |
| `--info` | `#33c8ff` | information, interactive, focus rings, links, default accent |
| `--warn` | `#ffb22e` | standby, caution, maintenance |
| `--alert` | `#ff4d52` | incident, error, overload |
| `--accent-warm` | `#d94a1f` | sparing secondary accent (hub) — use rarely |

**Rule of thumb:** if it means *"working / alive / done well,"* it's `--live` green. If it
means *"here's information / tap me,"* it's `--info` cyan. Don't mix the two meanings.

### Status & tier mapping (replaces the old per-file greens)
- **Deployed / Live / Active** → `--live` `#7EFF00`  *(was `#3fe08a`; now the brand green)*
- **Standby** → `--dim` (neutral)
- **Maintenance / Caution** → `--warn`
- **Incident / Error / High-fatigue** → `--alert`
- Per-agent **accent** (`--tc` on a cell) stays each character's own colour from the roster.

## 2. Typography

| Token | Family | Use |
|------|--------|-----|
| `--font-display` | **Oswald** | headings, agent names, brand wordmark, big numbers |
| `--font-ui` | **Barlow Condensed** | body copy, labels, buttons, most UI text |
| `--font-mono` | **JetBrains Mono** | data, timestamps, tags, status chips, feed lines |

One weight scale: 400 normal, 500 medium, 600 semibold (headings), 700 bold (display/brand).
Letter-spacing is part of the look: wide tracking (`.1em`–`.3em`) on mono labels and the brand.

## 3. Motion

Three canonical avatar animations (from the floor scaffold) — keep these names:
- **`bob`** — idle breathing, `var(--bob)` (3s). Every avatar, staggered by `--d`.
- **`groove`** — brief "active/working" wiggle (~1.6s) when an agent is pinged or acts.
- **`rockon`** (`.wave`) — "speaking/celebrating" tilt, used on Ping / focus.

Always honour `prefers-reduced-motion` (tokens.css already disables `[data-anim]`/`.char img`).

## 4. Avatars

Driven by [`world/brand/avatars/`](../world/brand/avatars/) — the swappable manifest +
`resolve-avatar.js`. Surfaces resolve by agent name; never hardcode an image path.
- **Style:** cutout PNG/WebP with alpha, `drop-shadow`, soft ground ellipse, `bob` idle.
- **Fallback:** the brand green skull (`noun-skull-2314-7EFF00.svg`) until art is dropped in.
- **Pending art:** DIME, GIGGUIDE, RANDY, DIO, NEIL → vinyl-initials placeholders for now.

## 5. Layout

- **The floor:** 15 slots, `216px` cells, `14px/12px` gaps. Orientation toggles **5×3 ↔ 3×5**;
  **slot 8 (index 7) is dead-centre in both — Dime's seat.** Scales to fit width (`fit()`).
- **The hub (orchestration console):** 3 zones — floor (left) · full-height comms feed (centre)
  · map+inventory (right). Breakpoints: **≥1240px** three-col · **980–1240px** two-col ·
  **<980px** single-col. Incident mode overlays.
- **Roster order:** Dime centred on the floor; DIME-first in the hub crew list (ANIMA badge).
  NEIL = relay/concierge, not a second orchestrator.

## 6. Live-data contracts (the seam to Hermes)

Keep these so the dashboards can go from ambient demo → real Hermes events with no re-skin:
- **Choreography-as-data verb set:** `{ t, who, state, x, dur, say, fx, cls, label, stageClass }`
  — what an agent is doing, where, what they say. The animator/floor consume this; CC's Hermes
  overlay can emit it.
- **Hub feed:** the `normalFeed` array is the seam — replace the `setInterval` ambience with
  real Hermes events later. Blocked/approval/incident events render in their role colours
  (`--alert` / `--warn` / `--live`).

## 7. Conformance checklist (every new surface, incl. the chat board)

- [ ] Imports/copies `world/brand/tokens.css`; **zero** hand-picked hex values.
- [ ] Green only ever means live/active/success; cyan only ever means info/interactive.
- [ ] Oswald / Barlow Condensed / JetBrains Mono — no other fonts.
- [ ] Avatars via `resolve-avatar.js` + the manifest (fallback skull if no art).
- [ ] `prefers-reduced-motion` respected.
- [ ] Consumes the verb set / feed contract above where it shows agent activity.
- [ ] **Known trap:** never put the literal `</script>` sequence inside HTML/JS comments in a
      generated-HTML tool — the tokenizer doesn't honour JS comments (see session-log bug #1).

---
*v1 — navy+cyan locked, green=live / cyan=info. The chat board folds in against this checklist.*
