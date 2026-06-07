---
name: management-contracts
description: Use when the user asks about the TERMS of an artist management agreement — commission rate, contract length, scope, sunset clauses, key-person, what's commissionable. Trigger on phrases like "what commission does a manager take", "standard manager percentage", "15% or 20%", "management contract terms", "how long is a management deal", "sunset clause", "key man clause", "what's commissionable", "is this management contract fair", "should I sign this management agreement". This is GENE's management-deal-terms skill. It is NOT for defining what a manager does (use manager-role) or royalty mechanics (use royalty-types / mechanicals).
---

# Management Contracts

A management agreement sets the business terms between an artist and their manager: how much the manager is paid (commission), on what income, for how long, with what scope, and what happens when the relationship ends. The goal of this skill is to help the user understand the standard structures and the clauses that most affect them, so they can negotiate and recognize unfair terms — not to draft or approve a contract. Canonical reference: https://www.promohype.com/blog/artist-management

## Instructions

1. Explain **commission** — the manager's core pay — as a percentage of the artist's earnings, commonly in the **15–20%** range (15% is typical; 20% appears in some deals). Stress this is a customary range, not a law, and is negotiable.
2. Define **what is commissionable**: clarify which income streams the percentage applies to. Push the user to scrutinize whether recording, touring, merch, publishing, and brand deals are all included, and whether certain pass-through costs (e.g., tour production costs, opening-act fees, recording costs) are **excluded** from the commission base so the artist isn't commissioned on money they never keep.
3. Cover the **term (length)**: management deals often run a few years with options/renewals. Encourage reasonable initial terms and caution against very long lock-ins, especially before the artist has leverage.
4. Explain the **sunset clause**: after the deal ends, the manager often continues to earn a *declining* commission on income from deals/work initiated during the term, tapering over a few years to zero. This protects the manager's investment while freeing the artist over time — its presence and the taper schedule matter a lot.
5. Explain the **key-person ("key man") clause**: if the specific manager the artist signed with leaves the management company, the artist may exit — protecting the artist from being handed to a stranger.
6. Flag other terms to read: **scope/exclusivity** (does the manager represent the artist for everything?), **expenses** (which costs the manager can charge back and any caps/approvals), **power of attorney** limits, **accounting/audit** rights, and **termination** provisions.
7. Give a quick fairness lens: commission in the customary range, a sensible commission base with proper exclusions, a not-excessive term, a tapering sunset, a key-person clause, and clear expense/accounting rules.
8. State firmly that this is general industry education, **not legal advice** — every management agreement should be reviewed by a qualified music/entertainment attorney before signing.

## Examples

- User: "Is 20% commission normal?" -> 15–20% is the customary range; 15% is the common baseline and 20% sits at the higher end. It's negotiable, and what matters as much as the number is what income it applies to and what costs are excluded.
- User: "What's a sunset clause?" -> After the deal ends, the manager keeps earning a shrinking commission on income from work started during the term, tapering to zero over a few years. Check the taper schedule and which post-term income it touches.
- User: "The contract commissions my gross touring income." -> Raise the red flag: tour production and similar costs often eat most of gross, so commissioning gross can mean paying commission on money you lose. Look to exclude major pass-through costs from the base.
- User: "Should I sign this 5-year exclusive management deal?" -> Walk through term length, commission and base, sunset, key-person, and expenses — then strongly direct them to a music attorney before signing; don't bless or reject the contract yourself.

## Guidelines

- Always present commission as a customary range (15–20%), negotiable, and emphasize the **base** (what's commissionable and what's excluded) as much as the percentage.
- Do explain sunset and key-person clauses by default — they're the terms users most often don't know to ask about.
- Do apply a fairness lens but never tell the user a specific contract is "fine to sign"; that requires their attorney.
- Don't quote commission percentages as fixed rules or imply any term is industry-mandated.
- Edge case: 360-style or all-in deals that commission publishing/brand income broadly — flag the wide base and the need for careful review.
- Output: the key terms (commission, base, term, sunset, key-person, expenses), a plain fairness read, and a clear not-legal-advice caveat directing the user to a music attorney.
