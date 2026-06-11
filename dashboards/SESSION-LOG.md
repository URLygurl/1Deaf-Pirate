# SESSION LOG — Deaf Pirates Dashboard Build
**2026-06-11 · Claude session**

## Shipped
1. **`floor-scaffold.html`** — the source of truth. WYSIWYG editor: 15 slots, per-slot backdrop/avatar upload (auto-optimised: backdrops ≤720px JPEG, avatars ≤520px PNG w/ alpha), identity fields, persona/voice-lines/caps, avatar size+position sliders, featured-slot toggle, slot swapping. Orientation toggle 5×3 ↔ 3×5 (slot 8 is dead-centre in both — Dime's seat). Save/Load project JSON (file-based, no browser storage). **Export** bakes a standalone `deaf-pirates-studio-floor.html`.
2. **`deaf-pirates-hub.html`** — her Orchestration Hub, surgically patched: crew cards are now floor cells (backdrop + animated cutout), Specialist Focus gets a scene banner, NEIL added (FOH concierge, relays user↔Dime, home-cinema lounge). Desktop = 3-zone console: floor left · **full-height comms feed centre** · map+inventory right. ≥1240px three-col, 980–1240 two-col, mobile single-col. Incident mode intact.
3. **`deaf-pirates-studio-floor.html`** — standalone wall-display floor (superseded by scaffold exports going forward).
4. Earlier prototypes: stage engine v0.1/v0.2 (jam/studios/club choreographies), iso dashboard — concepts now folded into the above.

## Assets
- Extracted from her scene-builder's embedded data: **8 cutouts** (lemmy, evh, geddy, halford, hetfield, nikki, angus, ozzy) + **30 backdrops**.
- Cut **slash + gene** from raw uploads via rembg (u2net) — gene's black-on-black came out clean.
- Optimised: cutouts → WebP-alpha (~26KB ea), backdrops → 720px JPEG q70 (~40KB ea).
- **Avatars still pending: DIME, GIGGUIDE, RANDY, DIO, NEIL** → vinyl-initials placeholders. Drop-in path: cutout → ASSETS key → `char:` field.

## Decisions locked
- Architecture: payload-driven cells + shared renderer; choreography-as-data verb set `{t, who, state, x/dur, say, fx, cls, label, stageClass}` — same format CC's Hermes overlay could emit.
- Hub `normalFeed` array = the seam for live Hermes events later.
- Roster order: Dime centred on the floor; DIME-first in hub crew list (ANIMA badge). Neil = relay, not a second orchestrator.
- Green Room retired for Neil's slot; easy to revive as 16th cell / after-hours mode.

## Bugs for the vault
1. **`</script>` inside a comment** killed the scaffold — HTML tokenizer doesn't honour JS comments; the comment *documenting* the rule contained the forbidden sequence. Two cascading SyntaxErrors from one byte. *Grep every generated-HTML tool for this — scene-builder included.*
2. **Grid sparse auto-placement cursor never reverses** — col placed in column 3 before a column-2 sibling bumps the sibling to row 2 (invisible "missing panel"). Fix: explicit `grid-row:1`.
3. Node `--check` passes ≠ browser parses — HTML tokenization happens first. Playwright is the truth.

## Next obvious moves
- Render the 5 missing avatars, run through cutout pipeline.
- Wire hub feed to real Hermes events (replace setInterval ambience).
- Optional: choreography scenes (jam/club) as a hub mode; Green Room return.
