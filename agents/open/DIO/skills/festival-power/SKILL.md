---
name: festival-power
description: Use when the user is planning temporary power for festivals, outdoor events, or multi-stage sites — generator sizing and selection, fuel/runtime planning, mains-vs-genny decisions, ring-main/distribution across a site, redundancy/backup, earthing of temporary supplies, and wet-weather/outdoor power safety. Triggers on "festival power", "generator for event", "how big a genny", "site power plan", "outdoor stage power", "temporary power distribution". NOT for fixture load math alone (use lighting-power-calc) or distro hardware detail (use distro-fundamentals). Planning guidance only — a competent/licensed person commissions and connects temporary supplies.
---

# Festival & Event Temporary Power

How to plan electrical power for temporary outdoor events where there is no fixed building supply, or where mains is supplemented by generators. Covers estimating total site load, choosing and sizing generators, fuel and runtime, distributing power safely across a wet and public site, building in redundancy, and the earthing/protection that keeps a temporary install as safe as a permanent one. Festival power is high-stakes: public exposure, weather, long cable runs, and generators all raise risk — so planning is thorough and connection is always done by competent, qualified people.

## Instructions
1. Build a full site load schedule first: every stage, PA, lighting rig, LED wall, catering, traders, bar fridges, site lighting, welfare/medical, and office/comms. Festival load is dominated by non-show loads (catering, traders, refrigeration) as much as by stages.
2. Convert each area to amps/kW (see lighting-power-calc) and total it, then apply diversity sensibly but size generators to realistic peak, not nameplate sum — and add margin.
3. Size generators to run comfortably below their continuous rating (target ~70-80% loaded for efficiency and headroom), accounting for power factor, inrush from motors/refrigeration, and surge. Undersized gennies cause brownouts, voltage dips, and audio/desk crashes.
4. Plan fuel and runtime: calculate consumption at expected load, size the tank/bowser for the show duration plus reserve, and schedule refuelling that does not require shutting down a live stage. Consider hybrid/battery or grid-mains where available to cut fuel, noise, and emissions.
5. Decide topology: typically one or more gensets feeding main distros, then a distributed ring/tree out to areas. Keep critical loads (medical, emergency lighting, comms) on their own resilient supply.
6. Build redundancy for critical and headline loads: N+1 generators, automatic/manual changeover, and a plan for genset failure mid-show. Never put a headline stage on a single point of failure with no backup.
7. Earthing and protection are non-negotiable: temporary generators need a proper earth (earth electrode/earthing arrangement appropriate to the system), and all circuits need RCD/RCBO protection. Earthing of a temporary supply is a specialist task — assign it to a qualified person.
8. Address the outdoor reality: IP-rated connectors and distros, cable ramps and elevated runs, protection from rain/standing water, public segregation/barriers, and weather contingency. Wet ground plus mains is a lethal combination.
9. State clearly that connecting generators, making off feeders, setting up earthing, and energising temporary site power is the work of a competent/licensed electrician under local rules (AS/NZS 3000 + AS/NZS 3001-style temporary-supply guidance in NZ/AU).

## Examples
- User: "What size generator do I need for a stage with a 20kW rig?" -> Total the rig plus any associated loads, add margin and target ~75% loading: ~20kW show load points toward a ~30kVA+ set after PF and headroom; recommend rounding up and confirming with the supplier, plus a fuel/runtime plan.
- User: "Can one generator run my whole festival?" -> Probably not safely without redundancy; explain splitting stage/critical loads from catering/traders, N+1 for headline stages, and the risk of a single point of failure taking down the event.
- User: "It's going to rain at our outdoor event - what do I do about power?" -> Push for IP-rated distros/connectors, elevated and ramped cable runs, generators and distros sheltered and off wet ground, RCD protection everywhere, public barriers, and a qualified electrician to commission it.
- User: "How much fuel will our generator burn over a weekend?" -> Estimate from the set's consumption curve at expected load x hours, add reserve, and plan refuelling without killing live stages; suggest the supplier provide a consumption figure for the actual load.

## Guidelines
- DO produce a full site load schedule (show AND non-show loads), size gennies with headroom and redundancy, and plan fuel/runtime explicitly.
- DO treat earthing of temporary supplies and generator connection as specialist, qualified work.
- DON'T let any unqualified person make off feeder tails, set up generator earthing, or energise site power.
- DON'T size a generator to its peak rating, ignore inrush/refrigeration surge, or put critical/headline loads on a single supply.
- EDGE CASES: long site cable runs need voltage-drop allowance; multiple gennies may need synchronising or careful load segregation (don't parallel non-paralleling sets); noise/emissions limits and local consent may apply; standing water and public access sharply raise risk.
- OUTPUT: a load schedule, generator size/quantity with redundancy, fuel/runtime plan, a distribution topology, and a protection/earthing/weather plan to hand to the electrical contractor. Local regulations and a qualified electrician govern the real install.
- Canonical reference: https://festivalandeventproduction.com/special-guides/electricity-guide/
