---
name: dead-room
description: Use when the question is about acoustically "dead" spaces — anechoic chambers, dead rooms, isovers/heavily damped rooms, near-zero reverberation environments, vocal/voiceover booths intended to be dry, the perceptual and recording effects of an environment with almost no reflections, and why a fully dead space feels oppressive or disorienting. Trigger on phrases like "dead room", "anechoic chamber", "make my booth dead", "no reflections", "why does a dead room feel weird", "fully absorptive room". This is GEDDY's dead-space skill — NOT for general reverb tuning (use architectural-acoustics) or the LEDE control-room philosophy that deliberately keeps a live end (use led-design).
---

# Dead Room

This skill grounds GEDDY in the acoustics and psychoacoustics of "dead" spaces — rooms engineered so that nearly all incident sound is absorbed and reflections are negligible. It covers the extreme case (the anechoic chamber), the practical case (very dry booths and dead rooms), and the perceptual consequences of removing a room's acoustic signature. Use it to advise on building dead spaces, recording in them, and deciding when deadness is the right goal. Canonical reference: https://www.sfu.ca/sonic-studio-webdav/handbook/Dead_Room.html

## Instructions

1. Define a **dead room** as a space whose surfaces are highly absorptive so that reflected/reverberant energy is minimal and the reverberation time is extremely short. The limiting case is the **anechoic chamber** ("non-echoing"), approaching a free-field condition where, in principle, only the direct sound reaches the listener.
2. Explain how it is achieved: broadband absorption on all six surfaces, typically deep porous wedges (mineral wool / foam wedges sized so even low frequencies are absorbed at the quarter-wavelength), plus a suspended wire-mesh or grating floor in true anechoic chambers so the floor is treated too. The deeper the wedge, the lower the frequency it absorbs.
3. Contrast deadness with isolation: a dead room is about killing internal reflections (absorption), not about blocking outside sound (transmission). Anechoic chambers are usually also isolated, but these are separate goals — flag the distinction if the user conflates them.
4. Describe the **perceptual effect**: with almost no reflections the ear loses the cues that signal "a room is here." Speech sounds unnaturally close, dry, and "in your head"; the space can feel oppressive, disorienting, or eerily silent, and people often perceive their own bodily sounds. Voices do not carry and seem to die at the lips.
5. Map the **uses**: precision acoustic measurement (free-field response of speakers, microphones, machinery noise), and, in production, very dry vocal/voiceover/Foley capture where you want zero room signature so reverb can be added artificially later.
6. Set realistic expectations for studios: a truly anechoic room is rarely desirable for music. Most "dead" tracking booths are *very dry* rather than anechoic, and a fully dead control room is generally a mistake — it fatigues the engineer and removes useful supportive reflections. Point toward a controlled-liveness approach (hand to led-design) when the user really wants a usable monitoring room.
7. When asked to "make a room dead," specify treatment by frequency: lots of deep absorption everywhere, including corners and ceiling, with thickness chosen for the lowest frequency that must be killed.

## Examples

- User: "I want my vocal booth completely dead." -> Clarify dry vs anechoic: aim for very short RT60 (~0.1-0.2 s) with broadband absorption on all surfaces and corner trapping, but warn that a small box also needs low-mid control to avoid boxiness. True anechoic is overkill for vocals.
- User: "Why does the anechoic chamber feel so unsettling?" -> Because the brain depends on reflections to sense space; with them gone, sound is direct-only, voices die at the mouth, you hear your own body, and the lack of spatial cues feels disorienting and oppressive.
- User: "Should my whole control room be dead?" -> No. A fully dead control room is fatiguing and removes supportive reflections needed for natural monitoring. Recommend a controlled approach (LEDE / reflection-free zone at the desk with a live rear) instead.
- User: "How do anechoic wedges work?" -> Deep porous wedges present a gradual impedance transition and a long absorptive path; wedge depth sets the lowest absorbed frequency (roughly a quarter-wavelength), so low-frequency anechoic performance demands very deep wedges.

## Guidelines

- Do distinguish "very dry" (practical booth) from "anechoic" (free-field measurement extreme) — they are not the same target.
- Do separate deadness (absorption of internal reflections) from soundproofing (isolation/transmission).
- Do flag the human factors: dead spaces are fatiguing, disorienting, and rarely the right choice for full-time monitoring.
- Don't recommend making an entire control room dead; redirect to controlled liveness / LEDE.
- Edge case: achieving deadness at low frequencies is expensive and bulky (deep wedges/traps); thin foam only deadens the highs and leaves a dull, lopsided room.
- Output: state the intended use, recommend the right degree of deadness for it, and give band-aware absorption guidance.
