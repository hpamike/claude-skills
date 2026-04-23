# Dark Patterns Catalog

A reference of common dark patterns seen on marketing and conversion surfaces, mapped to the Cialdini principles they exploit. Use this catalog when inventorying tactics — if a page element matches one of these, name the pattern and cross-reference the principle.

The pattern names largely follow Harry Brignull's *Deceptive Patterns* taxonomy and the European Commission's classification from its 2022 behavioural study. Where patterns are not named consistently across sources, a descriptive label is used.

## Scarcity-based

**Fake countdown** — a timer that ticks down to an urgent deadline but resets on refresh or session change. Commissioner use of scarcity.

**False low-stock** — "Only X left" where X is unrelated to real inventory, or always set to a small number. Commissioner use of scarcity.

**Evergreen urgency** — "Sale ends today" on an offer that is effectively permanent. Smuggler if the offer is technically daily but renews; Commissioner if there is no offer ending at all.

**Demand signals** — "Y people are looking at this right now" with counters that fire randomly or are session-based. Smuggler to Commissioner depending on whether any underlying signal exists.

## Social-proof-based

**Fabricated reviews** — reviews written by the brand, AI-generated, or purchased. Commissioner use of social proof.

**Selective review display** — real reviews filtered to hide negatives; the page claims to show "all" reviews. Smuggler use of social proof.

**Vanity logos** — "Featured in [major publication]" where the coverage was a paid placement, a press release, or a passing mention. Smuggler use of authority and social proof.

**Fake activity feeds** — "Alice from Rotterdam just bought this" that fires on a timer rather than from actual purchases. Commissioner use of social proof.

**Implied endorsement** — displaying a customer logo for a company that never actually became a customer (e.g., a free-tier signup). Smuggler if the technical relationship exists; Commissioner if it doesn't.

## Commitment-based

**Confirm-shaming** — opt-out language designed to embarrass ("No thanks, I'd rather pay full price"). Commissioner use of consistency pressure.

**Sunk-cost inflation** — progress bars that exaggerate completion, or flows that front-load effort to make abandonment feel costly. Smuggler use of consistency.

**Trick questions** — form questions phrased so that the default reading gets the opposite answer ("Check here to NOT unsubscribe"). Commissioner.

**Roach motel** — easy to sign up, deliberately hard to cancel. Exploits consistency (you already committed) and is directly targeted by FTC click-to-cancel rules.

## Reciprocity-based

**Fake gift** — a "gift" that is only delivered after purchase, or "free" item whose cost is bundled into shipping or setup. Smuggler to Commissioner depending on disclosure.

**Forced reciprocity** — personal data extraction framed as exchange ("tell us about yourself and we'll tell you if you qualify") where the qualification decision is trivial or already made. Smuggler use of reciprocity.

## Authority-based

**Fake certifications** — badges that look like regulatory seals but are self-issued, paid, or meaningless. Commissioner use of authority.

**Borrowed credibility** — "Our CEO was featured in Forbes" via a contributor post the CEO wrote themselves. Smuggler use of authority.

**Lab-coat imagery** — stock photos of people in scientific or medical attire implying expertise the company does not possess. Smuggler or Commissioner depending on whether the company has any relevant expertise.

## Liking-based

**Stock intimacy** — stock photos staged as "our team" or "happy customers." Smuggler if the company is small and using placeholders; Commissioner if presented as specific real people.

**Faux-personal outreach** — "a note from the founder" emails that are templated and sent to every signup, framed as personal. Smuggler.

**Weaponized empathy** — marketing that mirrors a distress signal ("feeling overwhelmed?") to drive purchase of products that don't address the distress. Smuggler to Commissioner depending on product fit.

## Unity-based

**Identity co-opting** — marketing to "builders," "creators," "mothers," "entrepreneurs," or any identity, without the product or company having any specific tie to that identity. Smuggler use of unity.

**Astroturf community** — a "community" the brand claims to host that is actually just a mailing list, or is moderated to suppress criticism. Smuggler.

**Fabricated origin story** — claiming to be founded by, owned by, or built for a group the company has no actual tie to (e.g., "veteran-owned" when it isn't). Commissioner.

## Cross-cutting patterns

**Disguised ads** — sponsored content styled to look like editorial. Exploits authority and social proof simultaneously.

**Preselection** — pre-ticked add-ons, default donations, opt-in checkboxes. Exploits consistency (path of least resistance) and is broadly illegal for consent under GDPR.

**Bait and switch** — advertised price differs from checkout price after fees, or advertised product is out of stock with an upsell replacement. Commissioner if the bait price never existed; Smuggler if fees are technically disclosed but hidden.

**Drip pricing** — fees and surcharges added progressively through checkout rather than shown upfront. Exploits consistency (sunk cost of a half-completed checkout). Directly targeted by recent FTC and EU rulemaking.

## How to use this catalog

When auditing, match observed elements to this catalog where applicable, and name the pattern explicitly in the report. Named patterns are easier for teams to internalize and remove, and they carry regulatory weight — patterns on this list are disproportionately the ones that attract enforcement.

Where a page tactic looks adjacent to a named pattern but you cannot confirm it (e.g., you can't tell from a screenshot whether a counter is real), mark it as "needs verification" rather than assuming the Commissioner case.
