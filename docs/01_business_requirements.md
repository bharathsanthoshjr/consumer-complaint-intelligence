# Business Requirements

**Status:** Draft v0.1 (Week 1)

## Stakeholder

Head of Customer Complaints, JPMorgan Chase credit-card business.

> This stakeholder is fictional and created for a portfolio project. All analysis uses public
> data from the CFPB Consumer Complaint Database. Nothing here reflects internal information
> from JPMorgan Chase or any other bank.

## Problem

The complaints team receives thousands of credit-card complaints but cannot easily see which
issues need management intervention, or how its complaint handling compares with comparable
card issuers.

**Central business question:**
How does JPMorgan Chase's handling of consumer credit-card complaints (volume, timeliness,
reported outcomes and backlog) compare with its peers, and where (by issue, state and customer
segment) are the gaps concentrated enough to justify management attention?

## Objective

Identify complaint trends, timeliness and outcome gaps relative to a defined peer group, and
recommend which problems management should investigate first.

## Scope

| In scope | Out of scope (for now) |
|---|---|
| Product: credit card | Other products (checking, mortgage, etc.) |
| Complaints received from 1 January 2023 | Earlier years |
| Client: JPMorgan Chase | Internal bank data of any kind |
| Core peers: Citi, Bank of America, Capital One/Discover, American Express, Wells Fargo, Barclays US, U.S. Bank | Credit bureaus and non-bank companies |
| Sensitivity peer: Synchrony (mostly store cards) | Complaint narratives (used only in the AI phase) |

## Business questions

| # | Area | Question | Method |
|---|---|---|---|
| Q1 | Volume | How is our monthly complaint volume trending, and is it rising faster or slower than our peers'? | Monthly and rolling 3-month trends, complete months only |
| Q2 | Timeliness | Is our timely-response rate below the peer benchmark? | Peer median and pooled peer rate, with a confidence interval on the gap |
| Q3 | Categories | Which complaint issues generate the most complaints for us? | Issue distribution and Pareto analysis |
| Q4 | Outcomes | Do our customers receive relief less often than customers of comparable issuers? | Relief rate on closed complaints at least 60 days old |
| Q5 | Backlog | What share of our complaints is still in progress, and how old are they? | Backlog ageing: 0-15, 16-30, 31-60 and 60+ days |
| Q6 | Issue growth | Which complaint issues are growing faster for us than for our peers? | Rolling 3-month and year-over-year growth, minimum volume threshold |
| Q7 | Geography | In which states is our share of complaints unusually high compared with our peers? | Peer-relative state share index, minimum volume threshold |
| Q8 | Vulnerable customers | Do complaints from older customers and servicemembers differ in issues or outcomes? | Segmentation using the CFPB Tags field |
| Q9 | Unusual changes | Which changes in our complaint patterns are statistically unusual rather than normal variation? | Control limits and Poisson-based anomaly detection |
| Q10 | Priorities | Which problems should management investigate first? | Prioritisation score: volume x growth x poor-outcome rate x peer gap |

## Known limitations

1. **Not representative:** CFPB complaints come only from consumers who chose to complain to a
   regulator. They do not represent all customer experiences.
2. **Bank size:** complaint counts reflect each bank's size and customer base, so raw volumes
   are never compared across banks without context.
3. **No resolution time:** the data has no date when the bank resolved a complaint. Timeliness
   is measured only by the CFPB's timely Yes/No flag. "Date sent to company" is CFPB routing
   time, not bank response time.
4. **Company-reported outcomes:** relief categories are reported by the company, not verified,
   and do not measure customer satisfaction.
5. **Recent complaints:** many recent complaints are still in progress, so outcome metrics use
   a 60-day maturity window and exclude the latest incomplete month.
6. **Association, not cause:** differences by issue, state or segment show where gaps are
   concentrated, not why they happen.