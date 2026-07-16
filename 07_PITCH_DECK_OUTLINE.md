# NaMo Care IP — Pitch Deck Outline

**For:** Investor presentations, buyer technical reviews, partnership pitches  
**Format:** Google Slides / PowerPoint (15–20 slides)  
**Duration:** 30 minutes (presentation + Q&A)  
**Date:** July 2026

---

## Slide 1: Title Slide

**Visual:** Hero image of elderly person with LINE messaging interface overlaid  
**Copy:**
```
NaMo Care
Production-Ready Medical-Grade Elderly Care Platform

เมตตาธรรมนำหน้า → Compassion First
"Elevate your existence with NamoNexus."
Human-centered AI, engineered with care.

Combining React Dashboard + LINE Bot Integration
Verified End-to-End | PDPA-Compliant | Deploy in 2 Weeks

Kanin Raksaraj
Senior AI Architect & Software Developer — Founder, NamoNexus
contact@namonexus.com | linkedin.com/in/namo-nexus-504b1b399 | github.com/icezingza
```

---

## Slide 2: The Problem (Market Validation)

**Layout:** 2 columns or 3 bullet points with supporting data

**Left/Top:**
```
Thailand's Elderly Crisis
- 14 million elderly citizens (9% of population, rising to 20% by 2050)
- Only 2% use digital health monitoring
- Caregivers manually check on elderly (can't detect emergencies in real-time)
- No technology for fall detection, missed medication alerts, inactivity warnings
```

**Right/Bottom:**
```
Current Solutions Fail
❌ Require smartphone adoption (elderly struggle with apps)
❌ Foreign solutions (no LINE integration, no Thai UX, no healthcare workflow fit)
❌ Expensive, fragmented, not PDPA-compliant
❌ High alert fatigue (staff ignores alerts = cry wolf)
❌ Compliance burden (audit trails, data deletion ignored)

Result: 98% of Thai elderly have zero digital monitoring
→ Preventable hospitalizations go undetected
```

**Visuals:** Chart of elderly population growth + screenshot of missed medication alerts

---

## Slide 3: Market Opportunity (TAM/SAM/SOM)

**Layout:** Large numbers with supporting metrics

```
Total Addressable Market (TAM)
฿4.1B—14B (Thailand elderly care + digital health segment)

Serviceable Addressable Market (SAM)
฿500M—1B (realistic capture: 10—25% of TAM)

Serviceable Obtainable Market (SOM)
฿30—50M Year 1 (50—100 hospitals × ฿30—50K/month license)

By Year 3: ฿100—300M cumulative revenue
```

**Visual:** Pyramid or funnel chart showing TAM → SAM → SOM

---

## Slide 4: Why Now? (Market Tailwinds)

**Layout:** 4 pillars with icons

```
🧓 Aging Population
Thailand #2 globally (after Japan)
9% → 20% by 2050
Healthcare spending +8% annually

🏥 Healthcare Digitalization
Government pushing digital health agenda
PDPA enforcement = compliance urgency
Private hospitals competing on elderly care services

💬 LINE Dominance
45M+ Thai users on LINE (messaging monopoly)
Elderly already familiar with LINE
No app installation barrier

⚡ Technology Readiness
Firebase serverless (scales to 1M+ users)
Firestore mature + reliable
Cloud Functions proven in healthcare

Why this moment matters:
→ First-mover window: 6 months (before competitors copy)
→ PDPA enforcement creates compliance urgency
→ LINE ecosystem locked-in (switching cost high for users)
```

---

## Slide 5: The Solution (Product Overview)

**Layout:** 3 boxes (Frontend | Backend | Architecture) with annotations

```
THREE COMPONENTS

📊 Web Dashboard (for caregivers/families)
✓ Monitor elderly's health metrics (inactivity, medication, mood)
✓ Receive real-time alerts (SOS, missed doses, unusual activity)
✓ Manage care settings (thresholds, medication schedules)
✓ Export data / delete user records (PDPA-compliant)
Tech: React 19, Vite, Tailwind, Firebase SDK

💬 LINE Bot (for elderly users)
✓ Receive daily medication reminders on LINE
✓ Report status ("ยา กินแล้ว" = took medicine ✓)
✓ Get SOS alerts from caregivers
✓ Chat with bot for emotional support (Dharma quotes, reminders)
Tech: LINE Messaging API, Cloud Functions

🚨 Backend Medical-Grade Alert Engine
✓ Zero false negatives guarantee (critical alerts never missed)
✓ Retry queue for failed LINE pushes (automatic recovery)
✓ PDPA audit trail (immutable, survives deletion)
✓ Medication scheduling, inactivity detection, emotion analysis
Tech: Node.js 20, TypeScript strict mode, Firestore, Firebase Admin SDK

→ Deploy anywhere: Firebase (recommended, 2-week setup)
→ Scales to 1M+ users (serverless, auto-scaling)
→ No custom infrastructure required
```

**Visual:** Architecture diagram (React ↔ Firestore ↔ Cloud Functions ↔ LINE API)

---

## Slide 6: Technical Verification (26 Scenarios Passed)

**Layout:** Checklist or test matrix

```
ALL FEATURES VERIFIED END-TO-END
Firestore Emulator (real SDK semantics, not mocks)

✅ Alert Reliability (26/26 scenarios)
   - LINE outage → queue → recovery → auto-drain
   - Retry queue tested with 100+ failed pushes
   - Dead-letter pipeline for unrecoverable messages

✅ Data Safety (620+ documents)
   - Delete user records in Firestore batches
   - Audit trail survives deletion (immutable collection)
   - Point-in-time recovery (7-day window)

✅ Medication Flow
   - Miss 5 doses → escalate alert severity
   - Threshold clamped (safety floors)
   - Audit-logged for PDPA compliance

✅ Concurrency
   - 5 scheduler runs attempt same alert ID
   - Only 1 alert created (idempotent dedup)
   - Race conditions resolved with Firestore transactions

✅ Security Rules
   - Client tries to read audit logs → Denied (deny-by-default)
   - Admin claims verified (custom Firebase auth)
   - Field-level validation enforced

✅ Compliance Export
   - Export user data + checksum
   - Complete data integrity verified
   - PDPA Article 20 ready (right to portability)

Code Quality:
→ TypeScript strict mode (no `any`)
→ 0 security vulnerabilities (audited vs. OWASP Top 10)
→ PDPA audit trail (who accessed what, when)
```

**Visual:** Green checkmark grid or pass/fail matrix

---

## Slide 7: Security & Compliance (PDPA Ready)

**Layout:** Two columns (Security | Compliance)

```
🔐 SECURITY MEASURES
- Firebase Authentication (ID token verification)
- Environment variable management (requireEnv/optionalEnv)
- No hardcoded secrets (all `.env` patterns checked ✓)
- Firestore security rules (deny-by-default for sensitive data)
- HMAC-SHA256 LINE webhook signature verification
- Rate limiting on compliance endpoints (1 export per user per 24h)
- Admin SDK access restricted (server-side only)

📋 PDPA COMPLIANCE
- Audit trail (complianceAuditTrail collection, immutable)
- Data portability (export all user data in 48 hours)
- Right to be forgotten (2-step deletion process)
- Consent tracking (elderly + caregiver opt-in logged)
- Data breach notification (audit trail for incident response)
- Data retention policy (auto-delete aged records after policy window)
- Staff access logging (who accessed what user data, when)

✅ Verified against:
   - OWASP Top 10 (all mitigations in place)
   - PDPA Thailand (all 5 principles compliant)
   - Healthcare data standards (medical-grade encryption, audit trail)
   - LINE API best practices (webhook validation, rate limiting)

No critical vulnerabilities found.
Status: PRODUCTION-READY
```

**Visual:** Shield icon + checklist + risk matrix table

---

## Slide 8: Business Model & Revenue

**Layout:** Pricing table + revenue projection graph

```
REVENUE MODEL: Per-Hospital Licensing

Standard Package: ฿30K—50K/month per hospital
→ Includes: alerts, LINE integration, compliance, support

Example Hospital (100 elderly patients):
License: ฿30K—50K/month
= ฿360K—600K/year
ROI: 2—3 months (hospital saves 10+ hospitalizations/year @ ฿100K+ each)

At Scale (100 hospitals):
Revenue: ฿36—60M/year
Gross Margin: 70—80% (software + support)
Net Profit: ฿25—48M/year

Repeat Customers:
→ Once deployed, switching cost = high (data lock-in)
→ Recurring revenue for 5—10 years
→ Upsell opportunities (advanced analytics, caregiver app)

Strategic Exit (Year 3—5):
→ 3—5x revenue multiple (typical healthtech)
→ ฿150M—250M valuation (at ฿50M revenue)
→ Strategic buyer (LINE, True Corp, hospital chain): ฿100M—500M+ offer
```

**Visual:** Pricing table + line graph showing revenue growth over 5 years

---

## Slide 9: Competitive Advantage (Network Effects)

**Layout:** 5 boxes or infographic

```
WHY NaMo CARE WINS

✓ First-Mover Advantage
   No competitor combines LINE + elderly-specific UX + PDPA compliance
   6-month window before copycats emerge
   → Network effects (see below) create protection

✓ Network Effects
   Elderly on LINE → Caregiver on dashboard → Hospital ecosystem locks in
   → Switching cost = high (elderly won't learn new app; data portability pain)
   → Grows exponentially as more hospitals adopt

✓ Recurring Revenue (Not One-Time)
   Monthly subscription model (฿30—50K/month) beats one-time license sales
   → Predictable, scalable, high LTV
   → Customer retention = profitability

✓ Sticky Product
   Once caregivers + elderly trust the platform, they don't switch
   → Data portability (PDPA) is painful
   → Retraining staff on new system = cost + risk

✓ Regulation Tailwind
   PDPA enforcement = compliance urgency for hospitals
   → Hospitals need audit-ready solutions (NaMo Care is ready)
   → Regulatory moat: competitors will take 6—12 months to catch up

✓ Scalable Technology
   Serverless (Firebase) = zero DevOps
   → Auto-scaling to 1M+ users
   → No infrastructure cost as volume grows
   → No hiring needed (no ops team required)

Defensibility:
→ Not built on proprietary tech (easy to copy)
→ Defensible because of network effects + first-mover + regulation tailwind
→ Best defense: get to 50—100 hospitals within 6 months
```

---

## Slide 10: Go-to-Market Strategy

**Layout:** 3-phase timeline or funnel

```
PHASE 1: QUICK WINS (Month 1—2)
Target: 5—10 hospitals (regional pilots)
Strategy: Direct sales to Bangkok private hospitals (high decision velocity)
Method: Demo → pilot agreement → 2-week deployment
Expected close rate: 60—80% (hospitals eager to differentiate)

PHASE 2: SCALE REGIONALLY (Month 3—6)
Target: 50—100 hospitals nationwide
Strategy: Tier 2—3 buyers (system integrators, telehealth platforms, franchises)
Method: Revenue-share or white-label partnerships
Expected close rate: 40—60% (longer sales cycle, but less direct work)

PHASE 3: NATIONAL PRESENCE (Month 7—12)
Target: 200+ hospitals + government healthcare network
Strategy: Government + private market simultaneous penetration
Method: System integrator partnerships + direct government procurement
Expected revenue: ฿30—50M Year 1 SOM

Metrics:
✓ Hospitals deployed (5 → 50 → 200)
✓ Monthly recurring revenue (฿150K → ฿2.5M → ฿10M)
✓ Customer retention (target: 95%+)
✓ Support cost per hospital (target: <10% of revenue)
```

**Visual:** Timeline or funnel chart showing progression

---

## Slide 11: Deployment Timeline (2 Weeks)

**Layout:** Gantt chart or week-by-week breakdown

```
WEEK 1: SETUP
Day 1—2: Buyer creates Firebase project (4 hours) + sets up LINE channel (4 hours)
Day 2—3: Deploy backend functions + Firestore rules (2 hours)
Day 3—4: Data migration / seed (2 hours)
Day 4—5: Configuration + white-label branding (4 hours)
Status: Backend live, frontend staging

WEEK 2: VALIDATION & GO-LIVE
Day 1—2: Team training (8 hours cumulative)
Day 2—3: Live testing in sandbox (with real elderly + caregivers)
Day 3—4: Bug fixes + optimization (if any)
Day 4—5: Production cutover + go-live support (24/7 on-call)

Post-Launch:
→ 2-week intensive support (bug fixes, optimization)
→ 6—12 month ongoing support (included in all packages)

Timeline: Day 1 → Day 14 to full production
```

**Visual:** Gantt chart with milestones

---

## Slide 12: Pricing Packages

**Layout:** 3-column comparison table (Package A | B | C)

```
PACKAGE A: CODE ONLY
$500K—$1M
✓ Full source code (React + Node.js)
✓ Firestore schema + rules
✓ Deployment scripts
✓ 1-week remote training (engineering team)
✓ Architecture documentation
✓ 26-scenario verification report
✗ No ongoing support after 90 days
Timeline: 2 weeks to deployment

PACKAGE B: CODE + 6-MONTH SUPPORT
$1M—$2M
✓ Everything in Package A
✓ 6 months technical support
   - Bug fixes (4-hour response for critical)
   - Optimization help
   - 2—3 additional training sessions
✓ White-label branding setup
✓ Go-live support (2-week intensive)
✗ No custom development
Timeline: 4 weeks to deployment

PACKAGE C: FULL TRANSITION (RECOMMENDED)
$2M—$3M
✓ Everything in Package B
✓ 12 months technical support + SLA
✓ Custom branding (advanced white-label)
✓ Data migration (if you have existing data)
✓ Source code escrow (you get code if we disappear)
✓ Full ops team training (10—15 people)
✓ Quarterly optimization + feature reviews
✓ Priority bug fix + feature development
Timeline: 6 weeks to deployment

ROI Example:
At 100 hospitals (Package C cost ÷ Year 1 net profit):
$3M ÷ ~$40K profit/month = ~37.5 months payback (Year 3)
By Year 3: ~$200K recurring profit/month
Strategic exit (Year 3–5): $13.4–25.7M valuation
```

**Visual:** 3-column pricing table with checkmarks/Xs

---

## Slide 13: Risks & Mitigations

**Layout:** Risk table (Risk | Impact | Mitigation)

```
RISK 1: MARKET ADOPTION (Hospitals slow to adopt new tech)
Impact: Revenue lower than projected
Mitigation:
→ Pilot with 2—3 hospitals first; prove ROI before scaling
→ Target hospitals already using digital tools (lower resistance)
→ Revenue-share with system integrators (they push adoption)

RISK 2: LINE API CHANGES (LINE modifies messaging API)
Impact: Integration could break
Mitigation:
→ LINE SDK mature + stable (6+ years); breaking changes rare
→ Monitored LINE release notes + API changes
→ Fallback: SMS + email alerts (alternative channels ready)

RISK 3: FIRESTORE COSTS (Database bills scale unexpectedly)
Impact: Margin compression at scale
Mitigation:
→ Projected ฿1—2K/month per hospital (acceptable)
→ Firestore pricing models understood; query optimization done
→ Can migrate to self-hosted Postgres if costs become prohibitive

RISK 4: COMPETITOR ENTRY (Competitor copies LINE + elderly care)
Impact: TAM splits
Mitigation:
→ 6-month first-mover advantage before competitors launch
→ Network effects + data lock-in protect market position
→ Regulatory compliance head start (we're PDPA-ready; they're not)

RISK 5: REGULATORY TIGHTENING (PDPA rules get stricter)
Impact: Compliance cost increases
Mitigation:
→ We're already ahead of curve (PDPA-ready today)
→ Strict compliance = competitive moat (not burden)
→ Proactive engagement with regulators (advisory board opportunity)

Expected Scenario:
→ Risks are manageable with mitigation strategy
→ No show-stoppers; market opportunity outweighs risks
```

**Visual:** Risk matrix (likelihood vs. impact) or risk table

---

## Slide 14: Financial Projections (5-Year)

**Layout:** Revenue + profit table or stacked chart

```
FINANCIAL PROJECTIONS (at 100 hospitals scale)

Year 1 (50 hospitals):
- Monthly revenue: ฿2M (~$57K USD)
- Annual revenue: ฿24M (~$686K USD)
- Operating cost: ฿7.2M/year (30% of revenue)
- Net profit: ฿16.8M/year (~$480K USD/year or ~$40K/month)
- Margin: 70%

Year 2 (150 hospitals):
- Monthly revenue: ฿6M (~$171K USD)
- Annual revenue: ฿72M (~$2.06M USD)
- Operating cost: ฿21.6M/year (30% of revenue)
- Net profit: ฿50.4M/year (~$1.44M USD/year or ~$120K/month)
- Margin: 70%

Year 3 (250+ hospitals):
- Monthly revenue: ฿10M (~$286K USD)
- Annual revenue: ฿120M (~$3.43M USD)
- Operating cost: ฿36M/year (30% of revenue)
- Net profit: ฿84M/year (~$2.4M USD/year or ~$200K/month)
- Margin: 70%

Exit Scenario (Year 3):
- Revenue multiple: 3—5x
- Valuation: ฿360M—600M (~$10—17M USD)
- Strategic buyer premium: +30—50%
- Expected exit: ฿468M—900M ($13.4—25.7M USD)

Path to Exit:
Option A: IP buyout (Year 1) → $2—3M immediate + potential earn-out
Option B: Equity + growth (Year 1—3) → Series B round → acquisition at $8—30M
```

**Visual:** Line chart showing revenue growth + profit margin over 5 years

---

## Slide 15: Why Us? (Founder/Team)

**Layout:** Founder bio + key achievements

```
🙏 FOUNDER: Kanin Raksaraj
Senior AI Architect & Software Developer — Founder, NamoNexus

"Architecting ethical, human-centered AI ecosystems. Specialist in
sovereign AI infrastructure and complex system integration.
Built for scale, engineered with care."

Background:
✓ Full-stack developer (React, Node.js, TypeScript)
✓ 6 months focused development on NaMo Care
✓ Shipped 26-scenario verification end-to-end
✓ Medical-grade code architecture (strict mode, audit trail, zero false negatives)
✓ Intimate knowledge of elderly care UX + LINE integration challenges
✓ PDPA compliance expertise + Thai healthcare workflow understanding

Why qualified to build this:
→ Deep passion for elderly care (family motivation)
→ Technical depth to execute without hiring
→ Capital efficient (built lean, no VC funding to date)
→ Market knowledge (Thailand elderly care, LINE ecosystem, healthcare regulations)

Why now:
→ Technology ready (not MVP; production-ready)
→ Market ready (regulations, aging population, LINE penetration all aligned)
→ Capital efficient (willing to bootstrap or accept non-dilutive funding)
```

**Visual:** Founder photo + logos of tech stack used

---

## Slide 16: Use of Funds (If Fundraising)

**Layout:** Pie chart or allocation table

```
FOR $1.5M SEED ROUND:

Allocation:
Sales + Marketing: $400K (30%)
  - Hire 1 sales engineer (Thailand market)
  - Marketing + thought leadership
  - Industry events + partnerships

Product + Engineering: $350K (23%)
  - Hire 1 backend engineer (scale ops)
  - Hire 1 frontend engineer (UI refinement)
  - Infrastructure + AWS migration (if Firestore costs exceed projections)

Operations + Legal: $300K (20%)
  - Hire 1 ops manager (customer support + onboarding)
  - Legal + compliance (contracts, PDPA advisory)
  - Working capital (hosting, tools, travel)

Contingency + Buffer: $450K (30%)
  - Customer success initiatives
  - Unexpected market opportunities
  - Bridge to profitability (if sales slower than projected)

Runway: 18—24 months to cash-flow positive
Exit timeline: Year 3—5
```

**Visual:** Pie chart or waterfall chart

---

## Slide 17: Call to Action (Next Steps)

**Layout:** 4-phase action items

```
NEXT STEP: REQUEST THE EVALUATION PACKAGE

You'll receive (within 24 hours of your request):
✓ Recorded demo video — dashboard, LINE Bot, emergency flow end-to-end
✓ Technical specification (architecture, Firestore schema, API docs)
✓ Security & compliance audit report (PDPA, OWASP Top 10)
✓ 26-scenario verification results
✓ Buyer FAQ (pricing, deployment, support, handoff)

Evaluate on YOUR schedule — all questions answered in
writing within 24 hours. NDA + private data room available
for deeper due diligence (source code samples, logs).

Then we finalize by email:
→ Which package fits your timeline (A/B/C)
→ Deployment start date + team training logistics
→ Support SLA terms

Timeline after package review:
→ Week 1: Proof-of-concept agreement + contract review
→ Week 2: Deployment begins
→ Week 4: You're live

Ready?
→ Request package: contact@namonexus.com
```

---

## Slide 18: Q&A

**Layout:** Blank slide with contact info

```
Questions?

Contact:
📧 contact@namonexus.com (all inquiries answered within 24 hours)
🔗 https://www.linkedin.com/in/namo-nexus-504b1b399
💻 github.com/icezingza

Follow-up materials:
→ Technical specification (architecture, API endpoints, Firestore schema)
→ Security audit report (OWASP + PDPA compliance)
→ 26-scenario verification results
→ Source code (under NDA)
→ Customer references (from pilot hospitals)

Let's build elderly care for Thailand. 🙏
```

---

## Presentation Tips

**Tone:**
- Passionate (not pitchy); genuine belief in mission
- Data-driven (show verification results, not claims)
- Thai hospitality (humble, respectful, collaborative)
- Medical-grade precision (no vague promises; specific timelines + metrics)

**Pacing:**
- Slide 1—5: Problem + opportunity (5 minutes)
- Slide 6—9: Solution + verification + competitive advantage (8 minutes)
- Slide 10—14: Go-to-market + financials + risks (10 minutes)
- Slide 15—17: Team + call to action (3 minutes)
- Slide 18: Q&A (5—10 minutes)

**Interaction:**
- Pause after Slide 5 for questions on market opportunity
- Demo on laptop/tablet during Slide 6 if possible (don't just talk about 26 scenarios; show emulator results)
- Invite questions after Slide 14 (financial projections always spark interest)

**Print/Digital:**
- Export slides as PDF for offline distribution
- Prepare 1-pager + executive summary as follow-up leave-behinds
- Have NDA ready (if discussing specific hospital partnerships in demo)

---

**Prepared:** July 2026  
**Status:** Ready for presentations  
**Contact:** contact@namonexus.com
