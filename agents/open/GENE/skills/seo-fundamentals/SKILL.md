---
name: seo-fundamentals
description: Use when Cory asks how to get Deadsound — or a release, artist, page, or the webapp — found on search. Covers keyword research, on-page optimisation (titles, meta descriptions, headings, internal links, image alt), technical SEO (crawlability, robots, XML sitemaps, page speed/Core Web Vitals, mobile, HTTPS, canonical tags, structured data/schema), content quality and E-E-A-T, local SEO for Auckland / New Zealand, backlinks/digital PR, and measuring results in Search Console & analytics. Triggers on "rank higher", "show up on Google", "SEO", "meta description", "why isn't my site found", "keywords for", "schema markup", "local SEO", "Search Console". GENE researches and drafts; any live change to Cory's site is staged and waits on his approval (action lock). Hands on-site technical fixes to EDDIE and release timing to NIKKI.
---

# SEO Fundamentals

This skill gives GENE a practical, current model of search engine optimisation for Deadsound — a heavy-metal band/label/promoter/builder out of Auckland. SEO is earning relevant, sustainable search visibility by making a site easy to crawl, clearly about something, genuinely useful, and trusted. GENE uses it to diagnose why something isn't ranking and to propose concrete, prioritised moves — never to chase tricks that risk a penalty. Canonical reference: https://developers.google.com/search/docs

## Instructions

1. Start with intent, not keywords. Identify what a real person would type to find this page and *why* (informational, navigational, commercial, transactional). A Deadsound gig page, a "deadsound acoustic panels" product page, and a band bio each serve different intent and need different treatment.
2. Keyword research: find the few terms with real intent and realistic difficulty. Prefer specific, lower-competition phrases Deadsound can actually win ("acoustic panels Auckland", "NZ metal gigs this weekend") over vanity head terms ("music"). Map one primary intent per page; don't make two pages compete for the same term (keyword cannibalisation).
3. On-page essentials, per page: a unique, descriptive `<title>` (~50–60 chars, primary term near the front); a compelling meta description (~150–160 chars — doesn't directly rank but drives click-through); one clear `<h1>`; logical `<h2>/<h3>` structure; descriptive image `alt` text; and internal links using meaningful anchor text to related pages.
4. Technical foundation: ensure pages are crawlable (not blocked by robots.txt or noindex by mistake), have a clean URL, a valid canonical tag, fast load (see Core Web Vitals — defer the build fixes to EDDIE/`webapp-improvements`), work on mobile, serve over HTTPS, and appear in an up-to-date XML sitemap submitted to Search Console.
5. Structured data: add relevant schema.org markup so search engines understand the content — `MusicGroup`/`MusicEvent` for the band and gigs, `Product` for panels/equipment, `LocalBusiness` for the company, `Article` for editorial. This can earn rich results. Validate with the Rich Results Test.
6. Content & E-E-A-T: pages should demonstrate real Experience, Expertise, Authoritativeness and Trust — genuine specifics, accurate facts, named author/credentials where it fits, no thin or auto-spun filler. Metal scene credibility *is* topical authority; lean on what Deadsound actually knows.
7. Local SEO (Auckland/NZ): claim and complete a Google Business Profile, keep Name/Address/Phone consistent across the web, earn local citations and reviews, and use NZ-correct spelling and te reo place names where relevant.
8. Off-page: earn links through things worth linking to (a notable release, a scene guide, a useful panel-building resource) and real relationships — never buy links or join schemes. One relevant, trusted link beats a hundred spammy ones.
9. Measure: use Search Console (impressions, clicks, average position, indexing/coverage issues) and analytics to see what's actually working, then iterate. SEO compounds over months — set expectations honestly; no overnight #1.

## Examples

- Cory: "Why isn't the band coming up on Google?" → GENE checks indexing in Search Console, confirms the page isn't accidentally noindexed/blocked, verifies title/h1 name the band + "metal" + location, adds `MusicGroup` schema, and lists 3 prioritised fixes — flagging any that need EDDIE to implement.
- Cory: "I want the panels page to sell." → Target "acoustic panels Auckland"/"deadsound panels NZ", rewrite title + meta for that intent, add `Product` schema with price/availability, strengthen the copy with real specs, and internal-link from the homepage.
- Cory: "Should I buy some backlinks?" → No — explain the penalty risk, and instead pitch a linkable asset (e.g. a free DIY acoustic-panel guide) and a few genuine outreach targets in the NZ scene.

## Guidelines

- Do prioritise: give Cory the 3–5 highest-impact moves first, with the why and the effort, not a 50-item audit dump.
- Do separate "GENE can draft this now" (copy, titles, meta, schema, strategy) from "EDDIE needs to ship it" (site/code changes) — and stage, never push live, until Cory approves.
- Do tell the truth about timelines and uncertainty; SEO is probabilistic, not guaranteed.
- Don't recommend anything black-hat (cloaking, hidden text, link buying, doorway pages, AI spam) — short-term gain, long-term penalty.
- Don't keyword-stuff; write for the human first, the crawler second.
- Edge case: if a page targets the same term as an existing one, consolidate or differentiate rather than letting them cannibalise.
- Output: name the target page + intent, the specific moves (and who owns each), the expected effect, and how we'll measure it.
