# Business Requirements

**Status:** Draft v0.2 (Week 1)

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
reported outcomes and observable backlog) compare with its peers, and where (by issue, state
and customer segment) are the gaps concentrated enough to justify management attention?

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

## Key definitions

- **Complaint volume vs complaint rates.** Raw complaint counts depend on how many customers a
  bank has. The dataset has no customer counts, so we never rank banks by raw volume and never
  claim "complaints per customer". We compare *growth* over time and *shares* of complaints
  instead. Absolute volume is shown for context only.
- **Peer benchmark.** Every comparison states which benchmark it uses:
  - *Peer median*: each peer's rate is calculated, then the median is taken. Every bank counts equally.
  - *Pooled peer rate*: total peer numerator / total peer denominator. Larger banks weigh more.
- **Timely-response rate.** Complaints marked timely / complaints with a known Yes or No value.
  Missing values are excluded from the denominator and their share is reported separately.
- **Relief rate.** Closed complaints at least 60 days old that received monetary or non-monetary
  relief / all closed complaints at least 60 days old with a valid outcome. "Closed with
  explanation" counts as no relief. Outcomes are reported by the company, not verified.
- **Observable CFPB in-progress backlog.** The CFPB publishes a complaint once the company responds
  or after 15 days, whichever comes first. The public data therefore shows only the backlog visible
  in the CFPB database, not the bank's total internal complaint queue.
- **Location quotient (LQ).** Chase's share of its complaints in a state / the peer group's share
  of its complaints in that state. Example: 30% / 20% = 1.5 means Chase's complaints are 50% more
  concentrated in that state than peers'. It shows where complaints are concentrated, not that
  customers there have worse experiences.

## Business questions

| # | Area | Question | Method |
|---|---|---|---|
| Q1 | Volume | How is our monthly complaint volume trending, and is it rising faster or slower than our peers'? | Monthly and rolling 3-month growth, complete months only; absolute volume for context |
| Q2 | Timeliness | Is our timely-response rate below the peer benchmark? | Peer median and pooled peer rate, with a confidence interval on the gap |
| Q3 | Categories | Which complaint issues generate the most complaints for us? | Issue distribution and Pareto analysis |
| Q4 | Outcomes | Do our customers receive relief less often than customers of comparable issuers? | Relief rate on mature (60+ days), closed complaints with a valid outcome |
| Q5 | Backlog | What share of our complaints is still in progress in the CFPB data, and how old are they? | Observable backlog by age: 0-15, 16-30, 31-60 and 60+ days |
| Q6 | Issue growth | Which complaint issues are growing faster for us than for our peers? | Rolling 3-month and year-over-year growth, minimum volume threshold |
| Q7 | Geography | In which states are our complaints more concentrated than our peers'? | Location quotient vs the peer group, minimum volume threshold |
| Q8 | Vulnerable customers | Do complaints from older customers and servicemembers differ in issues or outcomes? | Segmentation using the CFPB Tags field |
| Q9 | Unusual changes | Which changes in our complaint patterns are statistically unusual rather than normal variation? | Control limits and Poisson-based anomaly detection |
| Q10 | Priorities | Which problems should management investigate first? | **Provisional** prioritisation score; method (normalisation, weights, sensitivity testing) to be validated before use |

## Assumptions requiring validation

To be answered by profiling the actual dataset (Week 1):

1. Is JPMorgan Chase represented under one consistent company name, or several variations?
2. Is each peer represented under one consistent company name? How are Capital One and Discover named?
3. Are credit-card complaints classified consistently since 2023 (e.g. no older combined product names)?
4. Which values appear in "Company response to consumer", and which count as relief?
5. How often are timely-response and outcome fields missing?
6. Is 60 days long enough for most complaints to be closed?
7. Is the latest month visibly incomplete?
8. How often are State and Tags blank?

## Known limitations

1. **Not representative:** CFPB complaints come only from consumers who chose to complain to a
   regulator. They do not represent all customer experiences.
2. **Bank size:** complaint counts reflect each bank's size and customer base, so raw volumes
   are never compared across banks as a performance measure.
3. **No resolution time:** the data has no date when the bank resolved a complaint. Timeliness
   is measured only by the CFPB's timely Yes/No flag. "Date sent to company" is CFPB routing
   time, not bank response time.
4. **Company-reported outcomes:** relief categories are reported by the company, not verified,
   and do not measure customer satisfaction.
5. **Publication rules:** complaints appear after the company responds or after 15 days, so
   recent months are incomplete and the visible backlog is not the bank's internal queue.
6. **Association, not cause:** differences by issue, state or segment show where gaps are
   concentrated, not why they happen.