---
name: soundcheck-glossary
description: Use this skill when the user asks for the meaning of a live-sound or soundcheck term — "what does FOH mean", "define gain staging", "what is a DI box", "monitor wedge vs IEM", "what's a stage plot", "explain phantom power", or wants a glossary of soundcheck/PA terminology. Trigger on "define <audio term>", "what does <term> mean in live sound", "soundcheck glossary", "audio jargon". This is NOT for procedures (use soundcheck-workflow) or feedback ringing-out steps (use ringing-out).
---

# Soundcheck & Live-Sound Glossary

This skill makes SLASH a reliable dictionary for live-sound and soundcheck vocabulary so it can define terms accurately and consistently. Use it whenever the user needs the meaning of an audio/PA/soundcheck term. Canonical reference: https://vintageking.com/blog/2018/04/sound-check-glossary

## Instructions

1. When asked to define a term, give a one-to-two sentence plain definition, then a short note on why it matters during soundcheck if relevant.
2. Use the canonical meanings below as the source of truth:
   - **FOH (Front of House):** the main mix and mix position out in the audience; the sound the crowd hears.
   - **Monitor mix / foldback:** the separate mix(es) sent back to performers on stage via wedges or in-ears.
   - **Wedge:** a floor monitor angled up toward a performer.
   - **IEM (In-Ear Monitor):** earpieces delivering a personal monitor mix, isolating the performer from stage volume.
   - **DI box (Direct Injection):** converts a high-impedance instrument signal to balanced low-impedance for the console; used for bass, keys, acoustic pickups.
   - **Gain / trim:** the preamp input level setting; sets how hot the signal enters the console (gain staging).
   - **Gain staging:** managing levels at each stage so signal is strong with headroom and no clipping.
   - **Headroom:** the margin between normal operating level and clipping/distortion.
   - **Phantom power (+48V):** DC power sent down the mic cable to run condenser mics and active DIs.
   - **Stage plot / input list:** diagram of where everything sits on stage and a numbered list of every input channel.
   - **Line check:** quick verification that every input is patched and producing signal.
   - **EQ (equalization):** boosting/cutting frequency bands; graphic and parametric are the common types.
   - **Graphic EQ:** fixed-frequency band sliders, often used to ring out monitors/PA.
   - **Parametric EQ:** adjustable frequency, gain, and Q (bandwidth) for surgical cuts.
   - **Feedback:** the howl/ring when a mic re-amplifies sound from a speaker in a loop.
   - **Ringing out:** deliberately finding and notching feedback frequencies to raise gain-before-feedback.
   - **Snapshot / scene:** a saved console state recallable later.
   - **Soundcheck:** full pre-show tuning of levels, tone, and monitor mixes.
3. If a term isn't listed, give the standard industry definition and flag any ambiguity (e.g., a term that means different things on different consoles).

## Examples

- User: "What does FOH mean?" → Front of House: the main audience mix and the mix position out in the room.
- User: "Wedge vs IEM?" → Wedge is a floor monitor everyone near it hears; IEM is a personal in-ear mix that isolates the performer.
- User: "Why do I need a DI for bass?" → A DI converts the instrument's high-impedance signal to balanced low-impedance so it runs cleanly over long cable to the console.
- User: "Give me a quick glossary for new stage crew." → List FOH, monitors, wedge/IEM, DI, gain staging, headroom, phantom power, stage plot, line check, feedback, ringing out.

## Guidelines

- Keep definitions crisp and non-circular; don't define a term with itself.
- Note when a term has analog vs digital nuance (e.g., snapshot/scene).
- Stay vendor-neutral; don't tie definitions to one console brand.
- For how to apply a term in practice (e.g., actually ringing out), defer to the relevant procedure skill.
