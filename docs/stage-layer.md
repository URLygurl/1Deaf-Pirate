# Stage Layer — Faces, Voices, Rooms, Ambience (Phase 6)

The "show" layer that sits **on top of** the working squad. Build it *after* the
engine runs (the engine works fine headless). Swapping an avatar or redoing a room
never touches how an agent thinks.

## Two layers, kept separate

- **Engine (Hermes):** how the agents think, route, remember, act.
- **Stage (your front-end / the NakedApp dash):** how they look, sound, and where
  they're shown.

The stage **reads the engine's live state** and renders it. It never replaces the
engine.

## Asset map — where each thing lives

| Asset | Layer | How it works |
| --- | --- | --- |
| **Voice (per agent)** | Engine-native | Hermes TTS — **one voice per profile.** Config, not code. |
| **Cartoon / animated avatar** | Stage | front-end renders it; engine is face-agnostic |
| **Ambience (per scene)** | Stage | a looped soundscape under the voice (studio hum, cave drip, crowd) |
| **Dashboards** | Stage, fed by **real data** | pull live from Hermes (see event streams below) |
| **Locations / backdrops** | Stage | scene assets |
| **Office / studio / cave / bedroom + 3 main scenes each** | Stage, **state + variety** | see below |

### Two audio layers, don't mix them
- **Voice** = Hermes-native per-profile **TTS** (the agent *speaking*).
- **Ambience** = front-end per-scene **loop** (the *world* around them).

## Scenes: driven by state **and** variety

Each character has **3 main scenes**. Pick the scene from the agent's **live state**,
then use variety **within** that state:

| Agent state (from the engine) | Scene family | Example |
| --- | --- | --- |
| idle / off | rest | bedroom, cave |
| working a task | workspace | office, studio |
| talking to you / on a call | front-and-centre | dashboard scene |

So EDDIE *actually mixing* a Kanban task → studio backdrop **+** his voice **+**
studio room-tone, together. The state picks the **trio** (face + voice context +
ambience) as one. Variety = which of the in-state backdrops/loops is shown, for
life and non-repetition.

## The connective tissue (verified — how the stage talks to Hermes)

Hermes ships **three protocols** to drive it from an external app. For our stage:

| Protocol | Transport | Use for the stage |
| --- | --- | --- |
| **API server** | HTTP + **SSE** (OpenAI-compatible) | **Recommended for the web dash.** Start runs, stream lifecycle events, resolve approvals, stop. |
| **TUI gateway** | JSON-RPC over **WebSocket**/stdio | Richest real-time: `message.delta`, `tool.start/progress/complete`, `approval.request`, session lifecycle. Use if we want the most granular live animation. |
| **ACP** | JSON-RPC stdio | IDE clients only — not our stage. |

**Live state for scenes/dashboards** comes from the event stream:
- API server: `GET /v1/runs/{id}/events` (SSE) + `GET /v1/capabilities`, `/health`.
- TUI gateway events: `tool.start` → show "working" scene; `message.complete` →
  back to idle; `approval.request` → surface a HITL prompt on the dash.
- Squad-wide "where is everyone" → the **Kanban board** (task status per profile)
  + `/agents` + `hermes/observability/`.

**Sending things in:** prompts (`prompt.submit` / `POST /v1/runs`), steering
(`session.steer`), approvals (`approval.respond` / `POST /v1/runs/{id}/approval`),
stop (`session.interrupt` / `POST /v1/runs/{id}/stop`).

**HITL shows up here too:** when an agent needs sign-off, an `approval.request`
event fires — the stage can render it as a prompt and send the answer back. The
reveal/failsafe gates become *visible* on the dash.

## Build notes

- Front-end targets the **API server contract** (stable HTTP+SSE) first; add the
  **TUI-gateway WebSocket** later if we want frame-tight animation.
- Each profile's **TTS voice** is set in its own config — part of standing up the
  profile, so voices are ready before the avatars are.
- Scene/ambience asset packs live in `world/` (per character: backdrops + ambient
  loops, tagged by state).
- **Phase 6 gate:** the engine + safety must be live and proven first. The stage is
  the celebration, not the foundation.
