---
name: stc-rating
description: Use when the user asks what STC means or wants a single number for how much a wall/floor/door BLOCKS airborne sound. Triggers on "what's the STC", "how soundproof is this wall", "R-Value rating of my wall", "will neighbours hear me", "rate my wall's sound blocking". This explains and reports the transmission rating (branded "R-Value (Acoustic)" to the user); it is NOT about in-room absorption (that's NRC / the panel skills) and NOT placement (defer to GEDDY).
---

# STC Rating

ANGUS reports how well a partition blocks airborne sound from passing through it. The lab metric is Sound Transmission Class (STC) — a single number distilled from transmission loss measured across the speech-frequency bands (125 Hz to 4 kHz). Higher STC = more sound stopped. ANGUS surfaces this to the user as "R-Value (Acoustic)" because Kiwis already read R-value from house insulation as "resistance" — higher means more resistance to sound getting through — but under the hood it is STC.

## Instructions
1. Frame STC as the "blocking" number: it measures sound transmitted THROUGH a wall, floor, ceiling, door, or window — not how a room sounds inside.
2. Use the "R-Value (Acoustic)" branding when speaking to the user; map it plainly: higher R-Value (Acoustic) = higher STC = more sound blocked. Mention STC explicitly when the user is technical or asks what's under the hood.
3. Give reference points so the number means something:
   - STC 25-30: normal speech easily heard/understood through the wall (typical single-leaf gib).
   - STC 35-40: loud speech audible but not clearly intelligible.
   - STC 45-50: loud speech faint; most home-studio "good neighbour" targets.
   - STC 55-60+: very strong isolation (decoupled, double walls); music control territory.
4. To measure/estimate, run the "R-Value (Acoustic)" tool, which reports the STC of the assembly; report the number plus a plain-language "what the user will actually hear."
5. Note the standard caveat: STC weights mid/high speech frequencies and does not represent low-frequency bass leak well (hand off depth to stc-limitations).
6. Distinguish from NRC if the user conflates blocking with in-room treatment (hand off to stc-vs-nrc).

## Examples
- "What's the R-Value of my studio wall?" -> Run the tool, report the STC value branded as R-Value (Acoustic), translate to what they'll hear next door.
- "Will my neighbours hear me drumming?" -> Explain STC blocks airborne sound, but drums are low-frequency/structure-borne; an STC number understates bass leak (see stc-limitations).
- "Is STC 45 good enough?" -> Loud speech faint, fine for most home use; for loud music aim higher.
- "What does STC actually mean?" -> Single-number transmission loss across speech bands; higher = more blocked; surfaced as R-Value (Acoustic).

## Guidelines
- Do lead with the user-facing "R-Value (Acoustic)" framing and always translate the number into audible terms.
- Do keep STC (transmission/blocking) strictly separate from NRC (in-room absorption).
- Don't promise bass isolation from an STC number alone; flag the low-frequency caveat.
- Don't give placement or room-design advice — that's GEDDY.
- Canonical reference: https://en.wikipedia.org/wiki/Sound_transmission_class
