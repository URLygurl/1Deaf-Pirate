# Roadmap — The Whole Build in Plain English

No jargon. This is the map from "pile of files" to "living squad on your own
hardware." Each phase says **what it means**, **who does it**, and **why**.

Think of it like putting a band on the road: write the songs → rehearse →
soundcheck → small gig → big tour → buy your own venue.

---

## ✅ Phase 0 — Done already (tonight)
*The songs are written and the rulebook exists.*
- Built **80 skills** across 13 characters (their know-how).
- Built two safety tools: **reveal-gate** (no one performs until you say so) and
  **hive-loop** (the shared memory + a kill button).
- Wrote the **plan docs**: how the squad is shaped, how it stays safe, how it routes
  work, what brains it uses. All saved in `docs/` and in git (so nothing is ever
  lost again).

## 🎸 Phase 1 — Give them a home (Lightning AI)
*Rent a rehearsal space before buying a venue.*
- **You:** spin up a Lightning AI **Studio** (your GPU box) + first Hermes account.
- **Me:** turn each character into a **profile** (its own SOUL, skills, memory,
  name). Start with just **DIME + NEIL**.
- **Why:** prove it works on rented gear before committing to owned hardware.

## 🧠 Phase 2 — Give them memory (the brains)
*So they wake up smarter instead of starting blank every day.*
- **Me:** wire **Honcho** (main brain) + **Hindsight** (a second, different kind of
  brain) — both **self-hosted on your box** (free, private).
- **Me:** connect the **HIVE** (shared memory in git) so "what one learns, all learn."
- **Why:** memory is the whole point — and git is the backup that saves you from
  another 10-hour wipeout.

## 🗺️ Phase 3 — Teach them who does what (routing)
*So the right character answers the right call — no squabbling.*
- **Me + the agents:** each character writes its own **"what I'm for"** from its
  skills; neighbours check it for overlap; **DIME** settles the final map.
- **You:** approve the map.
- **Why:** clean routing = no two agents grabbing the same job.

## 🔒 Phase 4 — Safety check (before anyone goes live)
*Soundcheck with the fire marshal present.*
- **Me + you:** walk the **pre-launch checklist** (`docs/pre-launch-checklist.md`)
  and arm the **failsafes** (`docs/failsafes.md`) — kill switches, the `FREEZE`
  button, network leash, spend alerts.
- **Why:** the squad is powerful; we want the brakes tested before the gas.

## 🐣 Phase 5 — Let them out slowly (baby steps)
*Small gig first, not a stadium.*
- **You:** flip **DIME + NEIL** to live, **contained** (no internet, scoped tools).
- **Then:** widen ONE notch at a time — add internet (allow-listed), then supervised
  actions, then more characters — proving each step before the next.
- **Why:** "not the next natural disaster." Earned autonomy, never handed.

## 🎭 Phase 6 — Build the stage (faces, voices, rooms)
*Now they look and sound like themselves.*
- **You:** the avatars, animations, backdrops, rooms (office/studio/cave/bedroom),
  the 3 main scenes per character — the **world/front-end**.
- **Me:** wire **per-agent TTS voices** (Hermes does this natively, one voice per
  profile) and connect the front-end to Hermes' **gateway/API** so the stage talks
  to the real brains.
- **Why:** this is the "show" layer — it sits *on top of* the working squad.

## 🏠 Phase 7 — Move into your own house (physical boxes)
*Buy the venue once the act is proven.*
- **You:** buy + **vet** the 2 inference boxes (check firmware, isolate, watch their
  egress — the boxes get vetted before the squad moves in).
- **Me:** redeploy the squad onto them (it's a **move, not a rebuild** — everything
  is portable git + self-hosted).
- **Why:** owned hardware = full physical control + a true off-switch + redundancy.

## 👯 Phase 8 — Clone the second crew (girl squad)
*Same stage rig, new band, new songs.*
- **Me:** clone the **structure + process** (the factory), then build the girl
  squad's **own personas and own skills**.
- **Why:** the machine we built tonight makes every future squad faster.

---

### Who-does-what, in one line
- **You:** accounts, hardware, approvals, the look/voice/world, and every "go live."
- **Me:** the wiring, the skills, the safety code, the deploys, the docs.
- **Both:** the soundchecks and the slow reveal.

### The golden rule running through all of it
> Build it **portable**, reveal it **slowly**, keep the **brakes** in reach, and
> **log every decision**. Nothing goes live without your sign-off.
