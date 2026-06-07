---
name: compression-theory
description: Use when the user asks how compression works, how to set a compressor, what threshold/ratio/attack/release/knee/makeup gain do, how to fix inconsistent vocals or boomy bass with dynamics, or about specific techniques like parallel compression, sidechain ducking, bus glue, limiting, or multiband compression. Triggers on "how do I set my compressor", "what ratio should I use", "attack and release settings", "parallel compression", "sidechain", "vocal is too dynamic", "pumping". This is single-tool dynamics theory and application — NOT a full mix workflow (use mixing-essentials) and NOT EQ (use eq-theory).
---

# Compression Theory

This skill gives EDDIE a working theory of dynamic range compression: what each control does, why it does it, and how to dial compressors for real musical results. Dynamic range compression reduces the level difference between the loudest and quietest parts of a signal by attenuating audio above a set threshold, then optionally restoring level with makeup gain. Use it to explain controls, recommend settings, and pick the right compression technique for a source. Canonical reference: https://en.wikipedia.org/wiki/Dynamic_range_compression

## Instructions

1. Anchor on the core controls before recommending values: threshold (level above which gain reduction starts), ratio (how much above-threshold signal is attenuated, e.g. 4:1 means 4 dB in yields 1 dB out), attack (how fast the compressor clamps down), release (how fast it lets go), knee (hard = abrupt, soft = gradual onset), and makeup gain (restores perceived loudness after reduction).
2. Diagnose the goal first — consistency/leveling, transient control, glue, or a tonal/pumping effect — because the goal sets every parameter.
3. For leveling consistency (vocals, bass): moderate ratio (2:1-4:1), threshold set for ~3-6 dB gain reduction on peaks, medium attack, medium-to-fast release, soft knee. Follow with makeup gain matched by ear at equal loudness.
4. For transient shaping: slower attack lets the initial transient punch through before clamping (snappier drums); faster attack tames peaks and transients; release timed to the tempo/groove avoids pumping or breathing.
5. For glue on a bus: low ratio (1.5:1-2:1), slow attack, auto/program-dependent release, only 1-3 dB of gain reduction. This cohesion is subtle, not obvious.
6. For parallel (New York) compression: blend a heavily compressed copy under the dry signal to add density and sustain while keeping natural transients — great on drums and vocals.
7. For sidechain ducking: trigger one track's compressor from another (e.g. duck bass or pads from the kick) so elements share space without masking.
8. Reach for a limiter (∞:1 ratio, fast/brickwall) only for peak control/loudness ceilings, and multiband compression when only a specific frequency band misbehaves (e.g. boomy low end) rather than the whole signal.
9. Always gain-match before/after and A/B; compression that "sounds better" is often just louder. Confirm in the full mix, not solo.

## Examples

- User: "What ratio and attack should I use on lead vocals?" → Recommend 3:1-4:1, threshold for ~3-6 dB reduction, medium attack, medium release, soft knee, makeup to match; suggest serial light compression or a follow-up leveler for very dynamic singers.
- User: "My drum bus sounds flat after compressing." → Likely too-fast attack killing transients; lengthen attack to let hits punch through, reduce ratio, or use parallel compression to keep snap while adding body.
- User: "How do I get that pumping EDM kick-and-bass thing?" → Explain sidechain compression: key the bass/pad compressor off the kick with fast attack and tempo-matched release for rhythmic ducking.
- User: "My master is clipping on peaks but I don't want to squash it." → Use a limiter for transparent peak control with a low true-peak ceiling, rather than heavy compression across the whole track.

## Guidelines

- Do tie every setting to a goal — leveling, transients, glue, or effect — never default to "4:1 and forget."
- Do gain-match and A/B; louder is not the same as better.
- Do time release to the material's rhythm to avoid pumping/breathing (unless that pump is the goal).
- Don't stack heavy compression where light serial stages or automation would be cleaner.
- Don't compress in solo and trust it — judge in context.
- Edge case: very transient or already-consistent sources may need little or no compression; volume automation is sometimes the better tool.
- Output: give concrete starting parameters plus the reasoning, and note when to prefer parallel, multiband, sidechain, or a limiter instead.
