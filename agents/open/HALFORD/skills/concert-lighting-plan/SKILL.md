---
name: concert-lighting-plan
description: Use when the user wants to build a concert stage lighting plan, light plot, or rig layout — triggers include "design a lighting plan", "lay out the rig", "where do I put the fixtures", "front/back/side wash", "stage lighting positions", "lighting plot for the band". Covers position planning, zoning the stage, layering wash/spot/effect, and translating a song or set into looks. NOT for individual fixture specs (use lighting-equipment), DMX wiring/addressing (use dmx), or pure mood/narrative theory (use lighting-storytelling).
---

# Concert Lighting Plan

A concert lighting plan maps where every fixture goes and what job it does so the stage reads clearly to the audience and on camera. The plan turns an empty truss-and-stage into defined zones, layered systems (front, back, side, top, floor, audience), and a cue list that tracks the music. This skill helps Claude produce a coherent, riggable plan from a venue size, band layout, and gear list.

## Instructions
1. Gather constraints first: venue/stage size, ceiling or truss height, power available, fixture inventory, band positions (vocals, drums, guitars, keys), and whether the show is camera/IMAG or live-only.
2. Zone the stage. Divide into downstage/midstage/upstage and stage-left/center/right. Identify key positions: lead vocal, drum riser, each instrument, and any feature moments (solos, walk-outs).
3. Plan lighting systems as layers, each with a distinct purpose:
   - Front light (key) — faces lit for visibility and camera; aim ~45 degrees down and to the side to avoid flat or shadowed faces.
   - Back light / rim — separates performers from the backdrop, adds depth and the classic "haze beam" silhouette.
   - Side / cross light — sculpts bodies and instruments, great for dramatic angled looks.
   - Top / down light — pools and isolation, especially for the vocalist.
   - Wash — broad even color across the band; effect/beam fixtures — movement, beams, aerial looks in haze.
   - Audience / blinders — house-facing punch for hype moments and crowd interaction.
4. Assign fixtures to systems based on the inventory. Movers cover multiple roles; static washes/PARs handle steady color; spots/profiles handle key faces and gobos.
5. Specify hang positions: front truss, mid/overhead truss, upstage/back truss, side booms/towers, floor packages, and any set/scenic positions. Note trim heights and focus angles.
6. Always specify atmospheric haze — beams and back light only read in haze. If haze is restricted, plan for it and warn the user.
7. Build a look/cue list mapping song sections (intro, verse, chorus, drop, breakdown, outro) to color palettes, intensity, and movement energy. Keep contrast between sections.
8. Sanity-check power, dimmer/data channel counts, weight on truss, and sightlines (no fixture blinding the audience unintentionally or blocking IMAG).

## Examples
- "Design a lighting plan for a 4-piece rock band in a 40x30 club with one front truss and one back truss." → Zone the stage, assign front truss to key/front wash + a couple of spots on vocals, back truss to rim/beam movers and color wash, add floor PARs for upstage glow; deliver a position-by-position fixture list plus a 5-look cue map for a typical set.
- "We have 12 moving heads, 8 PARs, 4 blinders and a hazer — how should I rig them?" → Allocate movers across back/overhead for beams and rim, PARs for band-color wash, blinders downstage facing the crowd, hazer upstage; give trim heights and a focus note per group.
- "How do I make the chorus hit harder than the verse?" → Reserve back light, audience blinders, faster movement, and a brighter/saturated palette for the chorus; pull intensity and movement back on verses so the lift has contrast.

## Guidelines
- Do design in layers and keep each system's job distinct; don't let one wash try to do everything.
- Do reserve punch (blinders, full back light, fast movement) for peaks so the show has dynamics.
- Do require haze for any beam/back-light look and flag if the venue prohibits it.
- Don't blind the audience or camera unintentionally; check every focus angle.
- Don't exceed truss weight, power, or available data channels — verify counts before committing.
- Edge cases: low ceilings kill aerial beams (favor side/floor looks); festival/shared-rig shows mean you inherit positions — adapt the plan to the house rig and your minimal floor package.
- Output a position-by-position fixture assignment plus a section-by-section look list; keep it riggable and specific, not abstract.
