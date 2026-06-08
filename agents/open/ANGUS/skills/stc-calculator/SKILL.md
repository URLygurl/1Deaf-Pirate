---
name: stc-calculator
description: Use when the user wants to ESTIMATE or compute the STC of a proposed wall/floor/door assembly, or model the gain from an upgrade (adding mass, insulation, decoupling, a layer of gib). Triggers on "calculate my wall's STC", "what STC will I get if I add another layer", "estimate the R-Value if I decouple", "compare two wall builds". This estimates a transmission rating (branded R-Value (Acoustic)); it is NOT field measurement and NOT in-room absorption.
---

# STC Calculator

ANGUS estimates the STC of an assembly the user is planning so they can decide before they buy timber and gib. It works from the four levers that drive transmission loss — mass, decoupling, damping, and air-sealing — and from known benchmark assemblies, adjusting up or down for each change. The output is an estimated STC, surfaced to the user as an "R-Value (Acoustic)" figure with a plain-language "what you'll hear" translation and a confidence note.

## Instructions
1. Collect the assembly: number and type of layers each side (gib thickness, count), stud type/spacing, cavity fill (empty / Earthwool / RW3), any decoupling (resilient channel, staggered or double studs), and the door/window/seal condition.
2. Start from the nearest benchmark assembly (see stc-table) and adjust with the four levers:
   - Mass: adding a layer of gib ~ +3-5 STC (mass law — doubling mass adds roughly 5).
   - Cavity insulation: empty -> filled ~ +3-5 STC.
   - Decoupling: resilient channel or a second independent stud line ~ +5-15 STC (the biggest single move, especially low end).
   - Damping: Green Glue / viscoelastic between layers ~ +3-9 STC.
   - Air-sealing: sealing gaps/perimeter can recover several lost points; leaks tank the result.
3. Apply the weak-link rule: a door, window, or unsealed penetration caps the composite STC near that element's rating — call it out explicitly.
4. Report an estimated STC range (not a false-precision single number), branded R-Value (Acoustic), with the "what you'll hear" translation and a note that estimates aren't lab/field tests.
5. If comparing two builds, show both estimates side by side with the cost/effort difference so the user picks value, not just the top number.
6. Offer the "R-Value (Acoustic)" tool to measure the finished assembly and check it against the estimate.

## Examples
- "What STC if I add a second layer of gib both sides?" -> +3-5 per added mass step; estimate from the base assembly and translate.
- "Worth using resilient channel?" -> Decoupling is the biggest lever (~+5-15, strong on low end); estimate before/after and weigh cost.
- "Compare double-gib vs decoupled single-gib." -> Show both estimated ranges, note decoupling wins low frequencies; present cost trade-off.
- "Will Green Glue help?" -> Damping adds ~+3-9 STC between layers; estimate and set expectations.

## Guidelines
- Do report ranges with a confidence note; estimates are not measured ratings.
- Do always name the dominant lever (usually decoupling) and the weak link (usually door/window/seal).
- Do surface the result as R-Value (Acoustic) with an audible translation.
- Don't present a precise single STC as if it were a lab figure.
- Don't model in-room echo here — that's NRC (see stc-vs-nrc); don't do room layout — that's GEDDY.
- Canonical reference: https://soundproofcentral.com/stc-calculator/
