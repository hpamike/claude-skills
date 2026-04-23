# Worked Example

A short, fully-worked audit on a fictional SaaS landing page, to illustrate the expected depth and style. The page is invented for the example; any resemblance to a real product is coincidental.

## Input

URL: (fictional) `https://taskchime.example/pricing`

Page elements observed on screenshot:

- Hero: "The task manager loved by 12,000 teams worldwide"
- Logos strip: "Acme, Globex, Initech, Umbrella, Stark" under "Trusted by leaders"
- Three pricing tiers. Middle tier marked "Most popular — 73% of teams choose Pro"
- Banner over pricing: "Ends in 02:14:37 — annual plans 30% off"
- Testimonial block: three headshot photos with first-name-only quotes
- Footer badge: "SOC 2 Certified"
- Exit-intent popup: "Wait! Here's 20% more off — today only"
- CTA on free tier: "Start free (no credit card)"
- CTA on Pro: "Start free trial"
- Micro-copy under Pro CTA: "Only 3 seats left at this price"

## Output

### Persuasion Audit: TaskChime pricing page

**Context**
- Target audience: Small-to-mid team leads and operations managers evaluating task management SaaS.
- Conversion goal: Free trial signup on Pro tier; annual plan upgrade.
- Blind spots: Could not verify review sources, SOC 2 certificate registry entry, real-time counter behaviour, whether the countdown resets on refresh, or whether the "73% of teams choose Pro" statistic has an auditable source.

**Summary**
The page leans hard on scarcity and social proof, with several elements that are likely Smuggler or Commissioner in their current form. The free-tier CTA and the authority signal are Detective and working well. Two Commissioner-class risks ("3 seats left at this price" and the refreshing countdown) should be the first removals.

**Principles in use**

*Social proof*
- **On the page:** "Loved by 12,000 teams worldwide" and the logos strip "Trusted by leaders."
- **Classification:** Smuggler (needs verification).
- **Reasoning:** The 12,000 figure has no source or date. The logos do not link to a case study or named customer. If Acme, Globex, etc. are real paying customers, a linkable reference would move this to Detective.
- **Recommendation:** Add a dated source for the 12,000 figure (and specify "teams" vs "accounts"). Link each logo to a customer story or at minimum a named contact title. If the named logos are not paying customers, remove them.

*Social proof (testimonials)*
- **On the page:** Three first-name-only testimonials with headshots.
- **Classification:** Smuggler.
- **Reasoning:** First-name attribution without company or role makes the quotes unverifiable and is a common pattern for fabricated or ghostwritten testimonials, even when real.
- **Recommendation:** Add full name, role, and company, with permission. Link to a LinkedIn profile or a case study.

*Social proof ("Most popular — 73% of teams choose Pro")*
- **On the page:** Callout on the Pro tier.
- **Classification:** Needs verification (likely Smuggler).
- **Reasoning:** The number may be accurate but is unsourced. If it is a rolling figure from real signups, that can be a Detective claim with a date range.
- **Recommendation:** Add "(among teams signing up in Q1 2026)" or similar, sourced to internal data.

*Scarcity ("Ends in 02:14:37 — annual plans 30% off")*
- **On the page:** Site-wide countdown banner.
- **Classification:** Likely Commissioner (needs verification).
- **Reasoning:** If the banner resets on refresh or always shows roughly the same time, there is no real deadline — this is fabricated urgency, directly targeted by EU UCPD guidance and Dutch ACM enforcement.
- **Recommendation:** Verify whether the offer actually ends. If not, remove entirely. If it does, tie the timer to a real end timestamp and confirm it persists across sessions and refreshes.

*Scarcity ("Only 3 seats left at this price")*
- **On the page:** Micro-copy under the Pro CTA.
- **Classification:** Likely Commissioner (needs verification).
- **Reasoning:** SaaS "seats" are not inventory; they do not run out at a given price except by explicit pricing-tier policy. If the claim refers to a cohort-based price lock, say so; otherwise it is manufactured scarcity and high-risk under EU and UK consumer law.
- **Recommendation:** Remove unless it refers to a genuine, documented cohort or pricing window — in which case state the mechanism plainly ("First 100 teams at the 2025 price; 37 remaining").

*Scarcity (exit-intent "Wait! 20% more off — today only")*
- **On the page:** Exit-intent popup.
- **Classification:** Smuggler.
- **Reasoning:** If the popup fires for every visitor and the discount renews daily, the "today only" framing is misleading. The underlying discount may be real, but the urgency is manufactured.
- **Recommendation:** Either remove the urgency framing ("20% off for first-time signups") or tie the discount to a real limit (a cohort, a true calendar deadline).

*Authority (SOC 2 Certified badge)*
- **On the page:** Footer badge.
- **Classification:** Detective (if verifiable).
- **Reasoning:** SOC 2 is a real certification issued by auditors with a public registry reference.
- **Recommendation:** Link the badge to the certificate or a security.txt page with the auditor and report date. This strengthens a Detective signal.

*Reciprocity ("Start free — no credit card")*
- **On the page:** Free-tier CTA.
- **Classification:** Detective.
- **Reasoning:** A genuine low-friction way to experience the product before paying.
- **Recommendation:** Keep. Consider making the reciprocity more visible — a dedicated "why it's free" line reassures users who assume a hidden catch.

*Commitment & consistency*
- **On the page:** Not visibly in use on this page.
- **Note:** Could ethically be introduced — for example, an onboarding question that asks the user's main use case, and surfaces the matching tier's benefits next.

*Liking*
- **On the page:** Testimonial headshots, but no founder or team presence on this page.
- **Note:** Weakest principle on this page. If TaskChime has a distinctive founding story or team personality, surfacing it here (briefly) would add a Detective signal.

*Unity*
- **On the page:** Not in use.
- **Note:** If TaskChime serves a specific community (engineering teams, creative studios, municipalities), naming it explicitly would turn generic "teams" marketing into Detective unity. Only viable if the product genuinely serves that community.

**Missing principles (opportunities)**
- *Commitment* — a short use-case selector that tailors the page would add a Detective commitment layer.
- *Liking* — a visible "from the team" note or a founder photo, if authentic, would add warmth.
- *Unity* — if the product has a core community, name it.
- *Authority* — beyond SOC 2, the team's relevant experience is likely present but hidden; a one-line "Built by a team from [relevant prior companies]" is honest and strong.

**Dark pattern risks**

Two tactics carry the highest exposure:

1. The countdown banner, if it resets on refresh or renews automatically, is "false urgency" as defined by EU UCPD guidance and is a common target of Dutch ACM enforcement actions against e-commerce.
2. "Only 3 seats left at this price" without a real cohort mechanism is "false scarcity," similarly targeted.

The unsourced "12,000 teams" and "73% of teams choose Pro" figures, while lower-risk, fall under FTC guidance on substantiation for advertising claims in the US market and can be challenged under UK ASA rules.

**Prioritized recommendations**
1. Verify and, if not real, remove the countdown banner and the "3 seats left" micro-copy. These are the highest-risk tactics on the page.
2. Convert the social-proof block into Detective form: source the 12,000 figure and 73% figure, add full attribution to testimonials, link named logos to customer stories or remove them.
3. Add a small, authentic liking/unity signal — a founder line or community reference — if either is genuinely present in the business.
