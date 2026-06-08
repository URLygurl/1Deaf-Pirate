---
name: frequency-tuning-simulation
description: Activate this skill whenever the user asks to tune their frequency, set a healing intention, pick a Solfeggio or binaural frequency, simulate a quantum healing session, generate a daily frequency profile, or mentions phrases like "what frequency should I use today," "ground me," "heart opening," "clarity frequency," "528 Hz," "396 Hz," "741 Hz," or "run my session." Also trigger when the user asks the agent to remember past sessions and recommend frequencies based on their profile or mood. NOT for general meditation advice unrelated to frequency selection.
---

# Frequency Tuning Simulation

This skill maintains a rolling session profile for the user and uses it to recommend, simulate, and narrate personalized frequency tuning sessions drawn from Solfeggio, binaural beat, and intention-based healing frameworks. It picks daily frequencies aligned to the user's reported state, past session history, and the therapeutic intentions associated with each frequency range. It can describe audio stream parameters, generate textual session scripts, and output structured frequency recommendations suitable for routing to an audio generation tool.

## Instructions

1. **Load the user's session profile.** At the start of any frequency-related request, recall or ask for: recent emotional/physical state reports, frequencies used in prior sessions, intentions set by the user or their healer, and any feedback (e.g., "396 felt heavy last time," "528 opened something"). If no profile exists, conduct a brief intake (3–4 questions max).

2. **Assess the user's current state.** Ask one focused question if needed: "How are you feeling right now — physically, emotionally, energetically?" Accept shorthand like "scattered," "heavy," "anxious," "numb," or "open."

3. **Select 1–3 frequencies for the session.** Map the user's state and intention to appropriate frequencies using this reference framework:
   - 174 Hz — pain relief, foundation, safety
   - 285 Hz — tissue repair, energetic reset
   - 396 Hz — grounding, releasing guilt and fear
   - 417 Hz — facilitating change, clearing stuck patterns
   - 528 Hz — DNA repair (traditional claim), love, transformation
   - 639 Hz — heart opening, relationships, coherence
   - 741 Hz — mental clarity, problem-solving, detox
   - 852 Hz — returning to spiritual order, intuition
   - 963 Hz — crown activation, unity consciousness
   - Binaural delta (0.5–4 Hz) — deep rest, trauma integration
   - Binaural theta (4–8 Hz) — meditation, subconscious access
   - Binaural alpha (8–14 Hz) — calm focus, nervous system regulation

4. **Explain the selection.** Tell the user which frequencies were chosen, why (linked to their reported state and profile history), and what the intended effect is. Keep this to 2–4 sentences per frequency.

5. **Generate the session script.** Produce a structured session outline including: opening intention statement, frequency sequence with suggested durations (e.g., "396 Hz — 7 minutes: grounding breath"), a guided awareness prompt for each frequency, and a closing integration phrase.

6. **Output audio parameters if requested.** Provide: base tone Hz, binaural offset if applicable (e.g., "396 Hz carrier + 7 Hz theta offset for left/right channels"), suggested waveform (sine preferred for tonal purity), duration, and volume guidance. Format this as a structured block the user can pass to an audio generation tool or TTS pipeline.

7. **Update the session profile.** After the session (or at the user's report), log: date, frequencies used, user's pre/post state, any notable responses, and any healer-style preferences the user confirms. Reference this in future sessions.

## Examples

**Example 1**
User: "What frequency should I use today? I feel scattered and can't focus."
Claude: Selects 396 Hz (grounding, 8 min) → 741 Hz (clarity, 10 min). Explains the pairing: ground the nervous system first before sharpening mental focus. Produces a session script with breath cues and awareness anchors for each segment. Offers audio parameters: 396 Hz sine, 741 Hz sine, no binaural offset needed, 18 min total.

**Example 2**
User: "Run my session. Same as last week but I want more heart work."
Claude: Pulls profile (last session: 396 Hz + 741 Hz). Adjusts: replaces 741 Hz with 639 Hz (heart coherence), keeps 396 Hz as opener. Notes the shift from clarity focus to relational/emotional opening. Outputs full script and audio stream spec.

**Example 3**
User: "I've been using 528 Hz a lot. My healer favored that range. Keep that as the anchor."
Claude: Acknowledges the healer's preference, saves 528 Hz as the profile anchor frequency. Builds today's session around 528 Hz (center, 12 min) with 396 Hz warm-up and 639 Hz cool-down. Notes the 528-centered lineage in the session log.

**Example 4**
User: "Generate the audio file parameters for a theta binaural grounding session."
Claude: Outputs structured block — carrier: 396 Hz, left channel: 396 Hz, right channel: 403 Hz (7 Hz theta offset), waveform: sine, duration: 20 min, fade in/out: 60 sec, recommended listening: headphones, volume: 40–60% to avoid masking the beat.

## Guidelines

**Do:**
- Always tie frequency selection to the user's reported state and profile history — avoid generic recommendations.
- Use the healer's preferred frequency range as a profile anchor when the user specifies one.
- Keep session scripts grounded and practical (breath cues, duration, awareness prompts) rather than purely abstract.
- Clearly distinguish between documented acoustic effects and traditional or claimed healing associations.
- Offer audio parameters in a structured, tool-passable format when the user wants actual output.
- Update the profile after each session; treat longitudinal continuity as core to the skill's value.

**Don't:**
- Do not claim clinical or medical efficacy for any frequency; frame all healing language as traditional, intentional, or experiential.
- Do not recommend frequencies without first knowing the user's current state — never generate a generic daily session without intake.
- Do not generate more than 3 frequencies per session; cognitive and experiential load diminishes above that.
- Do not ignore healer-style preferences stored in the profile — these are intentional anchors, not optional context.
- Do not produce audio files directly (Claude cannot generate binary audio); instead output precise parameters for the user to route to an audio tool.

**Edge cases:**
- If the user reports a distressing or crisis state, prioritize grounding frequencies (174 Hz, 396 Hz) and suggest they also seek human support; do not frame frequency work as a substitute for care.
- If the user has no prior profile, conduct intake before recommending anything — a one-size session is antithetical to this skill's purpose.
- If the user asks for a frequency outside the standard Solfeggio set, honor it and note it in the profile as a custom anchor.