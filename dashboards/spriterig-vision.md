# SpriteRig — vision & trajectory

**Owner:** Cory · **Status:** Stage 1 (workshop tool, in this repo) · **File:** `dashboards/spriterig.html`

SpriteRig turns **one character image → a rigged 6-part puppet → posed animation frames →
pixel pass → packed sprite sheet + engine-ready metadata** (Phaser / Aseprite / Unity / Godot /
CSS), plus in-page GIF and a zip-everything export. Single file, all local, zero dependencies.
It exists to produce the **animated avatars** for the squad's faces (chat board, floor, world).

## Where it's going (3 stages)

1. **Now — workshop tool.** Lives here in `dashboards/` beside the other HTML surfaces.
   Personal, offline, no build step. ✅
2. **Next — standalone app in its own repo.** Full build-out: **DB + backend/middleware.**
   Characters, rigs, baked sheets, palettes and metadata become **stored, versioned, queryable**
   instead of living in one browser tab. Eventual auth / multi-user.
3. **Then (if needed) — a bridge tool.** Pipes SpriteRig's output sprites/sheets into the
   **existing animation tools** in this project — `defpirate-chat-demo.html`, `resolve-avatar.js`,
   `peachy-animator.html` — so the squad's faces flow straight onto the chat board / floor.

## Design principles to protect across the split

- **The core engine is portable.** The proven-correct logic (rig → bake → pixel pass →
  GIF89a → zip) is dependency-free client-side code. When it graduates, that core barely
  changes — you mostly *wrap* it (DB for artifacts, BE/MW for storage/versioning/auth). Follows
  the repo's own **graduation path** (open/exploratory → stable → productionised).
- **The metadata schema is the contract.** SpriteRig already emits five formats. Before the
  repo split, pick or define the **one canonical format** the DB stores and the bridge consumes —
  that schema is the join between all three stages. Get it stable and every later piece plugs in.
- **Verified correctness is an asset.** The GIF LZW encoder (fuzzed, 4k round-trips) and ZIP
  writer (canonical CRC32) are known-good; the two multi-clip export bugs (per-clip palette,
  per-clip fps) are fixed and browser-verified. Carry the tests forward when it becomes a repo.

## Prior art / reference — someone shipped a close cousin

**PhiloAgents** — *"AI Agents Inside a Videogame"* (The Neural Maze). AI-driven NPCs inhabit a
playable 2D browser world; players walk up and chat with them. It **validates the pattern** of
agents-as-characters in a rendered world, and its stack is a useful reference for our *world +
realtime + memory* layer (not our orchestration — that's ours):

| PhiloAgents | Maps to us |
|---|---|
| **Phaser 3** browser game (2D world, sprites) | our world/floor + chat board — **and SpriteRig already exports Phaser sheet metadata**, so its output drops straight in |
| **WebSocket** realtime player↔agent chat | the live chat surface (agents "walk on & talk") |
| **MongoDB** short + long-term agent memory | the **HIVE** ("what one learns, all learn") |
| **LangGraph** orchestration, agentic RAG | Hermes / DIME routing + the skills/brain layer |
| Groq (Llama 3.3 70B); FastAPI backend | our stack differs (Hermes + Claude) — reference only |

**Our edge:** DeafPirates is a *working squad* that does productive work under double-HITL, not a
single-player chat demo. PhiloAgents is the closest public **reference build** for the world-
rendering / realtime / memory plumbing — worth mining, especially the Phaser + WebSocket pieces.

Article: https://theneuralmaze.substack.com/p/ai-agents-inside-a-videogame
