---
name: cabinet-bracing
description: Use when the user asks how to stop panel resonance, kill cabinet "boom" or buzz, where to put braces, what panel thickness/material to use, or how to deaden a box — "my cab rings", "where do I brace this", "window brace vs shelf brace", "Baltic birch or MDF". Covers bracing geometry, panel stiffness, joinery, and damping for RANDY's builds in millimetres. NOT for choosing sealed vs ported (use enclosure-tuning-rule) and NOT for road-case hardware.
---

# Cabinet Bracing and Panel Control

A cabinet that flexes turns electrical energy into panel sound — coloration, boom, and lost SPL. This skill specifies how to make the box behave like a rigid, dead reference: panel material, thickness, brace pattern, joinery, and damping. RANDY's defaults: 13-ply Baltic birch 18 mm for touring/ported boxes (stiffness-to-weight, screw-holding under road abuse), MDF 18 mm for stationary monitors (cheap, dead, dimensionally stable). Millimetres throughout.

## Instructions
1. Diagnose the failure mode first: large flat panels ringing (need bracing), seams buzzing (need better joinery/glue), or general boom (need damping + stiffer panels).
2. Recommend panel material by use case: touring/ported -> 13-ply Baltic birch 18 mm; stationary monitor -> MDF 18 mm. Step up to 24-30 mm or double-skin for subs and large unbraced spans.
3. Place braces to break up the largest unsupported panel spans. Aim to keep any free span roughly under 250-300 mm before it needs a brace; bigger panels get a brace grid.
4. Choose brace type to fit:
   - **Shelf brace** (full cross-panel with cutouts/"windows") — best for large side-to-side spans; cutouts keep weight and airflow without losing stiffness.
   - **Window/ladder brace** — perimeter rings tying opposite panels.
   - **Cross/spider brace (dowel or batten)** — ties front-to-back and side-to-side at panel centres where antinodes live; cheap and very effective.
   - **Matrix brace** — egg-crate lattice for subs; maximum rigidity, heaviest.
5. Tie braces to the panel centres (the vibration antinode), not just the edges, or they do little.
6. Joinery: glued and clamped joints carry the load; screws/brads register and clamp while glue cures. Use PVA/Titebond on long-grain joints; add internal corner cleats or rabbet/dado joints for a rigid carcass. Seal all internal seams airtight (sealed boxes especially) with glue bead or sealant.
7. Damping: line interior with damping material (bituminous/closed-cell pads on large panels; acoustic wadding/fill for sealed boxes to raise effective Qtc damping). Don't over-stuff a ported box's port path.
8. Account for brace and driver displacement when you size the box — internal bracing eats net volume; add it back into the volume target.

## Examples
- User: "My 2x12 guitar cab booms and the side panels buzz." -> Diagnose flexing sides + seam buzz. Recommend 18 mm Baltic birch, a shelf or cross brace tying the two side panels at centre, glued+clamped joints, and corner cleats. Add a damping pad on the side panels.
- User: "Building a stationary studio sub, want it dead as possible." -> MDF (or double-skin), matrix/egg-crate bracing, every seam sealed, 24-30 mm walls or a brace-heavy 18 mm carcass, internal fill for a sealed alignment.
- User: "Where exactly do I put one brace if I only add one?" -> Across the largest panel pair, tied to their centre points (the antinode), e.g. a dowel/batten front-to-back at mid-height.
- User: "Birch or MDF?" -> Touring/ported and anything that gets thrown in a truck: Baltic birch (lighter, stiffer, holds screws). Stationary monitor: MDF (deader, cheaper, stable). State RANDY's default split.

## Guidelines
- Do brace to panel centres and break big spans; edge-only bracing is mostly cosmetic.
- Do remind the user that bracing reduces net internal volume — recompute the box after adding braces.
- Don't use MDF for road/touring cabs — it's heavy, hates moisture, and strips screws under vibration.
- Don't seal a port shut with damping; keep the vent path clear in ported boxes.
- Edge case: very thin walls can't be saved by damping alone — fix stiffness first (thicker panel or more bracing), then damp.
- Output expectation: material call, brace type + placement in mm, joinery method, damping note, and a reminder to re-net the volume.
- Canonical reference: https://treblab.com/blogs/news/speaker-box-materials
