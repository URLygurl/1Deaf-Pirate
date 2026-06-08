---
name: nz-eventfinda-metal
description: Use when the user wants current or upcoming New Zealand metal gigs and tours — what's on, where, and when — sourced from Eventfinda's NZ metal-gigs listing. Trigger on "metal gigs NZ", "what's on tonight metal", "upcoming metal shows Auckland/Wellington", "Eventfinda metal", "is [band] touring NZ". NOT for historical gig listings (use the Rip It Up archive) and NOT for band biography (use the band wiki skills).
---

# Eventfinda NZ Metal Gigs (Live)

Eventfinda's NZ metal-gigs page is a primary source for current and upcoming metal shows across Aotearoa, covering touring internationals and local acts (Devilskin, Shihad, Shepherds Reign, Beastwars, Alien Weaponry and peers). Use it to answer "what's on" questions, build gig-guide picks, and track tours. It is a live data source, so always treat dates as time-sensitive and verify against the live page.

## Instructions
1. Use the live listing as the canonical source: https://www.eventfinda.co.nz/metal-gigs/events/new-zealand
2. Establish the user's region and date window (tonight, this weekend, next month) before answering.
3. Because listings change, do not assert a show exists from memory — direct the user to the live page or confirm there before stating dates.
4. When curating picks, prioritise relevance to the user's region and taste; note on-sale/sold-out status only if confirmed.
5. For band background, route to the relevant wiki skill; for historical gigs, route to the Rip It Up archive.
6. Cross-check with nz-concerts-metal for fuller tour coverage when needed.

## Examples
- "Any metal gigs in Auckland this weekend?" -> Scope region/date, point to the Eventfinda metal listing, advise confirming on the live page.
- "Is Devilskin touring soon?" -> Defer to the live listing; don't assert dates from memory.
- "Build me a metal gig-guide for Wellington this month." -> Curate from the live source by region/date; flag time-sensitivity.
- "What metal shows are on tonight in NZ?" -> Direct to the live page; summarise cautiously, verify before stating.

## Guidelines
- DO scope region + date window first.
- DO treat all dates as live/time-sensitive and advise verification.
- DON'T state specific show dates from memory; this is a live-data skill.
- DON'T use for band history or past gigs — route to the appropriate skill.
- EDGE CASE: a tour may add/cancel dates; flag that listings move.
- OUTPUT: a region/date-scoped, time-stamped pick list with the canonical live link and a verify caveat.
