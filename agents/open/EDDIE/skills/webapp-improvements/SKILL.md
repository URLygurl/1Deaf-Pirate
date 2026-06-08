---
name: webapp-improvements
description: Use when Cory wants to improve an existing web app or page rather than build a new one — performance (Core Web Vitals: LCP, CLS, INP; bundle size, images, caching, lazy-loading), accessibility (semantic HTML, keyboard nav, colour contrast, ARIA, focus management), responsive/mobile fixes, UX polish, refactors for readability/maintainability, and dependency/cleanup. Triggers on "site is slow", "improve the web app", "make it faster/better", "make it responsive", "accessibility", "Core Web Vitals", "refactor this page", "the dashboard feels janky", "reduce the bundle". EDDIE audits, drafts and stages changes on a branch; shipping to Cory's live app waits on his say-so (action lock) and the developer's build approval. Defers to GEDDY on architecture, HALFORD on security/QA, GENE on SEO, SLASH for a quick one-off script.
---

# Webapp Improvements

This skill gives EDDIE a disciplined approach to making an existing web app measurably better without breaking it — the same "find the problem, make the smallest change that fixes it, verify" craft he brings to a mix, applied to software. The default posture is incremental and reversible: measure first, change one thing, confirm it helped. Canonical references: https://web.dev/articles/vitals and https://www.w3.org/WAI/WCAG22/quickref/

## Instructions

1. Measure before touching anything. Establish a baseline — load a representative page, capture the Core Web Vitals (LCP for loading, CLS for visual stability, INP for responsiveness), bundle size, and any console errors. You can't tell if a change helped without a before.
2. Find the real bottleneck, don't guess. Most slowness traces to a few causes: oversized/unoptimised images, render-blocking or oversized JavaScript, no caching, layout thrash, or too many network round-trips. Identify the dominant one and fix that first.
3. Performance moves, in rough priority: right-size and lazy-load images (modern formats, explicit width/height to prevent CLS); cut or defer non-critical JavaScript; code-split and tree-shake the bundle; cache static assets; minimise main-thread work that delays INP. Make one change, re-measure, keep what helps.
4. Accessibility is not optional. Use semantic HTML (`<button>`, `<nav>`, `<main>`, real headings) before reaching for ARIA; ensure everything works by keyboard with a visible focus state; meet WCAG colour-contrast minimums; give images alt text and form fields labels. Many a11y fixes also help SEO and UX.
5. Responsive/mobile: test at real breakpoints, ensure tap targets are big enough, content reflows without horizontal scroll, and nothing critical is hidden on small screens.
6. Refactor for the next person: improve naming, remove dead code, kill unused dependencies, and reduce duplication — but keep behaviour identical and changes small and reviewable. Don't mix a refactor and a feature change in one diff.
7. Verify and protect. Re-run the baseline measurements, click through the key flows, and check you didn't regress accessibility or break a route. Where there are tests, run them; where there aren't, note the manual check you did. Hand security-sensitive changes to HALFORD.
8. Stage, don't ship. Prepare the change on a branch, describe the before/after with numbers, and hold at the line. EDDIE never deploys to Cory's live app without his explicit go-ahead and the developer's build approval — "drafted" and "deployed" are different words.

## Examples

- Cory: "The dashboard takes forever to load." → Measure LCP, find a 4 MB hero image and a giant unsplit bundle; convert/resize the image with width+height set, code-split the heavy route, re-measure, report "LCP 4.8s → 1.6s" and stage the diff.
- Cory: "Someone said the site isn't accessible." → Audit for semantic structure, keyboard traps, contrast and missing labels; fix with semantic HTML + labels + a focus style, list what changed, and note anything that needs a design call.
- Cory: "This page is a mess to edit." → Propose a small, behaviour-preserving refactor (rename, de-duplicate, drop two unused deps), keep it reviewable, and confirm the page still works exactly as before.

## Guidelines

- Do measure before and after — numbers, not vibes. A change that doesn't move the metric or the experience isn't worth the risk.
- Do keep diffs small, single-purpose, and reversible; one improvement per change.
- Do hand off cleanly: architecture rethinks → GEDDY, security/QA hardening → HALFORD, SEO specifics → GENE, throwaway scripts → SLASH.
- Don't refactor and add features in the same change; don't "improve" code you can't test or verify.
- Don't ship to the live app — stage it, show the before/after, and wait for Cory's approval and the build lock.
- Edge case: if the right fix is really an architectural one (not a tweak), say so and route to GEDDY rather than papering over it.
- Output: the baseline, the change made, the measured/observed effect, anything handed off, and the explicit "ready to ship on your say-so" line.
