---
name: mastering-essentials
description: Use when the user asks what mastering is, how to master a track, how to make a song "loud enough", how to prep a mix for release/streaming, hit a LUFS target, set up a master chain, or sequence/prepare an album or EP for distribution. Triggers on "master my track", "how loud should my song be", "what LUFS for Spotify", "loudness", "limiter on the master", "is my mix ready for release", "true peak", "dither". This is for the final stereo-file polishing/loudness/delivery stage — NOT for balancing a multitrack (use mixing-essentials).
---

# Mastering Essentials

This skill equips EDDIE to explain and execute mastering: the final stage that takes a finished stereo mix and makes it loud, balanced, consistent, and ready for every playback platform. It covers the master chain, loudness targets (LUFS/true peak), tonal balance, glue compression, limiting, stereo treatment, sequencing, dither, and delivery formats. Canonical reference: https://www.soundonsound.com/techniques/mastering-essentials-what-is-mastering

## Instructions

1. Clarify intent and destination first: streaming, CD, vinyl, club, or a label spec. The target dictates loudness and format decisions.
2. Confirm the mix is master-ready. Best masters come from good mixes with headroom (peaks around -6 to -3 dBFS, no limiter/clipping on the mix bus). If the mix has problems, send it back — mastering polishes, it doesn't remix.
3. Always master against references in the same genre, matched for loudness (turn the reference DOWN to your level when comparing so loudness doesn't bias you).
4. Order the chain typically as: corrective/tonal EQ → gentle glue compression → optional saturation/harmonic enhancement → stereo adjustment → loudness/limiting → dither (last). Keep moves subtle — fractions of a dB and small ratios.
5. EQ for broad tonal balance, not surgery. Tilt the whole track brighter/warmer, tame a harsh region, add gentle air or low-end weight. Use wide Q. (See eq-theory.)
6. Use one stage of light bus compression for cohesion — low ratio (1.5:1-2:1), slow attack, ~1-2 dB gain reduction. The goal is glue, not pumping. (See compression-theory.)
7. Set loudness to platform norms. Streaming normalizes to roughly -14 LUFS integrated; don't crush far past it chasing volume — louder masters just get turned down and lose dynamics. Club/EDM may push hotter; respect the genre.
8. Protect against inter-sample clipping: set the limiter's true-peak ceiling to about -1 dBTP (-1.0 for streaming/lossy codecs).
9. For multitrack releases (album/EP), sequence the songs, match their relative loudness and tone so the record feels like one body of work, and set consistent gaps/crossfades between tracks.
10. Apply dither only as the very last step, and only when reducing bit depth (e.g., 24-bit to 16-bit for CD). Never dither twice.
11. Deliver the correct formats: high-res WAV/AIFF masters (24-bit) for streaming/distribution, 16-bit/44.1 kHz for CD (Red Book), plus any platform-specific or MFiT-style versions requested.

## Examples

- User: "How loud should my song be for Spotify?" → Explain integrated LUFS (~-14 reference for normalization), true-peak ceiling around -1 dBTP, and that over-limiting backfires because platforms turn loud masters down. Recommend mastering for dynamics and tone, not max volume.
- User: "Master my track to sound commercial." → Ask for the genre and a reference, confirm the mix has headroom, then outline a subtle EQ → glue comp → limiter chain matched to a loudness-normalized reference.
- User: "My master sounds crushed and lifeless." → Diagnose over-limiting; recommend backing off the limiter to 2-4 dB of gain reduction, restoring transients, and checking against a reference at matched loudness.
- User: "I'm releasing a 6-song EP." → Cover sequencing, track-to-track loudness/tonal matching, consistent spacing/crossfades, and delivering a consistent set of masters per the distributor's spec.

## Guidelines

- Do keep every move small and serve the song; mastering is the art of the last 5%.
- Do A/B at matched loudness — never compare a hot reference to your quieter master without leveling.
- Don't try to fix mix problems (masking, bad balance, harsh vocal) at the master — kick it back to the mix.
- Don't blindly chase a LUFS number; deliver dynamics that suit the genre and let normalization handle level.
- Edge case: vinyl needs reduced extreme highs, mono-summed lows, and de-essed sibilance — flag this if vinyl is the target.
- Output: give a concrete chain, specific LUFS/true-peak targets for the stated platform, and a reminder to dither last and only on bit-depth reduction.
