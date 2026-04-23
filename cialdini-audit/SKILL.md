---
name: cialdini-audit
description: Audits a website, landing page, checkout flow, email, ad, or other marketing asset through Cialdini's seven principles of influence — inventorying which persuasion tactics are in play and classifying each as ethical (Detective), misleading (Smuggler), or fabricated (Commissioner). Use this skill whenever the user wants to review, critique, or strengthen a marketing or conversion asset from a persuasion-psychology angle — including phrasings like "review this landing page," "audit this page for dark patterns," "is this persuasive or manipulative," "apply Cialdini to this," "what influence techniques is this site using," "make this page convert better without being sleazy," or when the user pastes a URL or screenshot of a sales/marketing page and asks for feedback. Also triggers when the user mentions specific tactics — scarcity banners, countdown timers, fake reviews, testimonials, "only X left," "10 people are viewing now" — and wants them assessed. Do not trigger for pure accessibility audits, performance reviews, visual design critiques unrelated to persuasion, or copy edits that don't touch conversion intent.
---

# Cialdini Audit

Audit a marketing asset through Cialdini's seven principles of influence, and classify every persuasive tactic as ethical, misleading, or fabricated — so the user can strengthen real persuasion and remove dark patterns.

## Why this framing matters

Cialdini's principles describe how persuasion actually works. They are neutral tools: a page *will* use them, whether the designer thought about it or not. The question is never "should this page be persuasive" — it already is. The question is whether the persuasion is **honest**.

Cialdini himself distinguishes three ways a principle can be deployed:

- **Detective** — the principle is real and honestly surfaced. (A genuine customer testimonial, a real inventory limit, an actual expert credential.)
- **Smuggler** — the principle is real but buried, distorted, or decoratively misrepresented. (Real reviews shown but negatives filtered out; a real discount, but the "original price" was never actually charged.)
- **Commissioner (fabricator)** — the principle is manufactured from nothing. (A "only 1 left!" counter that always says 1; an invented press logo; a fake countdown.)

Only Detective uses are ethical. Smuggler and Commissioner uses are dark patterns. They frequently raise short-term conversion but erode trust and increasingly trigger regulatory action (EU Digital Services Act, Dutch ACM, FTC, UK CMA).

Lead with this framing when talking to conversion-focused stakeholders: dark patterns are not merely unethical, they are **strategically bad** — they depress lifetime value, raise refund and chargeback rates, and invite enforcement.

## The seven principles

1. **Reciprocity** — people return what they receive. Free useful content, genuine gifts, upfront help.
2. **Commitment & consistency** — a small yes leads to a larger yes; people stay consistent with prior stances.
3. **Social proof** — we look to others, especially similar others, when uncertain.
4. **Authority** — we defer to credentialed, experienced, or institutionally-marked sources.
5. **Liking** — we say yes to people we like; similarity, genuine warmth, and cooperation drive liking.
6. **Scarcity** — we value what is rare, about to disappear, or competed for.
7. **Unity** — we say yes to members of "us"; shared identity, not merely similarity.

For heuristics on how each principle shows up as Detective / Smuggler / Commissioner, see `references/principle-heuristics.md`.
For a concrete dark-pattern catalog mapped to principles, see `references/dark-patterns-catalog.md`.
For the regulatory landscape (useful when you need to explain *why* a Smuggler tactic is costly beyond ethics), see `references/regulatory-context.md`.

## Workflow

Follow this sequence. It keeps the audit concrete and prevents hand-wavy critique.

### 1. Gather the material

If the user provides a URL, fetch the page and, if possible, a screenshot. If they provide screenshots or copy only, work from those. Note what you cannot see (interactive elements, A/B variants, logged-in state, mobile view) and state those blind spots in the report rather than inferring.

Before auditing, confirm or infer three things — ask the user if any are unclear:
- **Who is the target audience?** (B2B procurement, impulse consumer, distressed borrower, expert buyer, etc.)
- **What is the intended conversion?** (Email signup, free trial, paid purchase, upsell, subscription.)
- **What is the brand's strategic posture?** (Trust-building long-term relationship vs. one-shot transactional.)

These matter because the same tactic can be Detective for one audience and Smuggler for another. A countdown on a genuinely expiring Black Friday offer differs from a countdown on an evergreen product.

### 2. Inventory the tactics

Walk through the page top to bottom. For every visible element that could influence a decision — copy, badges, reviews, prices, buttons, banners, forms, images, micro-copy, default selections — identify which principle(s) it invokes. One element can invoke several (a testimonial from a known expert invokes both social proof *and* authority).

Be specific. Quote the exact copy or describe the exact element. Vague inventory leads to vague recommendations.

### 3. Apply the ethics test

For each tactic, classify as Detective / Smuggler / Commissioner. The question to ask is: **"What would have to be true for this to be a Detective use?"** If the answer is plausible and the page makes it easy to verify, it's Detective. If the claim is true but the framing obscures context, it's a Smuggler. If the underlying fact doesn't exist, it's a Commissioner.

When you cannot determine classification from what's visible (e.g., "1 left in stock" — you can't tell from a screenshot whether the counter is real), classify it as **needs verification** and say what would prove it Detective.

### 4. Check for missing principles

A page rarely uses all seven, and shouldn't — over-deployment itself reads as manipulative. But note principles the brand could *honestly* invoke and isn't. Reciprocity is under-used most often (few pages give before they ask). Unity is under-used by brands that actually serve a defined community but don't name it. Authority is frequently present in the business but buried on the page.

### 5. Produce the report

Use the template in the next section. Keep it concise and specific — the audit's value is in the per-tactic breakdown, not a rehash of the principles.

## Report template

Use this exact structure. It keeps the audit scannable for a product or marketing team.

```markdown
# Persuasion Audit: [page or asset name]

## Context
- Target audience: [inferred or provided]
- Conversion goal: [inferred or provided]
- Blind spots: [anything you could not inspect]

## Summary
[Two or three sentences. What the page is, what it's trying to do, overall ethical posture, headline finding.]

## Principles in use

### [Principle name]
- **On the page:** [specific element, exact quote where possible]
- **Classification:** Detective / Smuggler / Commissioner / needs verification
- **Reasoning:** [why, grounded in what is or isn't verifiable]
- **Recommendation:** [keep / reword / remove / substantiate]

[Repeat for each principle found]

## Missing principles (opportunities)
[Principles the page could ethically invoke but currently doesn't, with a concrete suggestion each]

## Dark pattern risks
[Any Smuggler or Commissioner uses, grouped, with a short note on regulatory exposure where relevant]

## Prioritized recommendations
1. [Highest-impact change — usually "remove or substantiate the riskiest Commissioner tactic"]
2. [Next — often "convert a Smuggler into a Detective"]
3. [Next — often "add a missing principle honestly"]
```

## Working principles for the audit itself

**Be specific, not impressionistic.** "The scarcity claim is manipulative" is less useful than "The '3 left in stock' banner resets on each page load (observed in two sessions); either tie it to real inventory or remove it." Specificity gives the team something to change.

**Recommend the Detective form, not just removal.** Most Smuggler tactics have a Detective version. Don't say "remove the testimonial block" — say "replace curated quotes with a live Trustpilot feed, accepting that the average score will appear."

**Hold the line on Commissioner tactics.** These are not stylistic disagreements. Fabricated scarcity, fake reviews, invented press logos, and countdown timers that reset are deceptive under EU, UK, and US consumer law. Flag them as legal risks, not just ethics concerns.

**Don't force all seven principles.** If the page uses three well, that is a finding, not a gap. Over-deployment feels like a pitch and backfires.

**Name the audience.** A tactic that is Detective for one audience can be Smuggler for another. A "limited cohort" for a high-ticket coaching program differs from "limited cohort" on a mass-market SaaS. State the assumed audience.

**Keep Cialdini's own standard in view.** He positions his work as a defense handbook first and a sales tool second. When the user is the buyer auditing a page they're about to buy from, the framing shifts — flag which tactics are working on *them*, not just what a designer did.

## What not to do

- Don't label a page "manipulative" as a summary judgment. Classify *tactics*, not pages. The same page can contain Detective authority signals alongside Commissioner scarcity; flatten neither.
- Don't confuse effective persuasion with manipulation. An honest urgency claim on a genuinely closing enrollment is Detective even if it feels uncomfortable.
- Don't invent dark patterns from thin evidence. If you cannot verify whether a counter is real, say "needs verification," not "this is fake."
- Don't moralize at length. The ethics framework is the whole point; applying it cleanly is more useful than lecturing about it.

## Source

Based on:
- Cialdini, R. (1984). *Influence: The Psychology of Persuasion.*
- Cialdini, R. (2016). *Pre-Suasion: A Revolutionary Way to Influence and Persuade.*
- Brignull, H. (ongoing). *Deceptive Patterns* (deceptive.design).
- European Commission (2022). *Behavioural study on unfair commercial practices in the digital environment.*
