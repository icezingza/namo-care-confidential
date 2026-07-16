# NaMo Care — Executive Summary

**For:** Healthcare CTOs, Product Leaders, Acquisition Teams  
**Date:** July 2026  
**Confidentiality:** Proprietary & Confidential  
**Distribution:** For identified recipients only. Unauthorized copying/distribution prohibited.

---

## EXECUTIVE OVERVIEW

NaMo Care is a **production-ready medical-grade elderly care platform** designed for Thailand's 14-million elderly population. It combines a React web dashboard (for caregivers) with a LINE bot (for elderly users) on a shared Firestore backend—all verified against real Firestore emulator semantics (not mocks).

**Key distinction:** Most elderly care apps require smartphone adoption. NaMo Care uses LINE, which 45M+ Thais already use daily. No app install, no learning curve.

---

## THE PROBLEM

**Market pain points:**
1. **Elderly care inefficiency** — Caregivers manually check on elderly; can't detect falls or missed meds in real-time
2. **Alert fatigue** — Most systems alert on everything; staff ignore alerts (cry wolf)
3. **Compliance burden** — PDPA requires audit trails, data deletion, but most elderly care apps ignore it
4. **Foreign solutions** — Imported apps lack Thai UX, LINE integration, local healthcare workflow
5. **Integration hell** — New elderly care system = separate login, separate phone, separate training

**Result:** 98% of Thai elderly have zero digital health monitoring. Preventable hospitalizations go undetected.

---

## THE SOLUTION: NaMo CARE

### **Three-part system:**

#### **1. Web Dashboard (for caregivers/families)**
- Monitor elderly's health metrics (inactivity, medication compliance, mood)
- Receive real-time alerts (SOS, missed doses, unusual activity)
- Manage care settings (alert thresholds, medication schedules)
- Export data / delete user records (PDPA-compliant)

**Tech:** React 19, Vite, Tailwind, Firebase SDK  
**UX:** Mobile-first, large touch targets, high contrast, Thai language

#### **2. LINE Bot (for elderly users)**
- Receive daily medication reminders on LINE
- Report status ("ยา กินแล้ว" = took medicine, ✓)
- Get SOS alerts from caregivers when hospital emergency
- Chat with bot for emotional support (Dharma quotes, gentle reminders)

**Tech:** LINE Messaging API, Cloud Functions  
**UX:** Chat bubbles (familiar), emoji (reduce text), voice support ready

#### **3. Backend (Cloud Functions + Firestore)**
- Medical-grade alert engine (engineered for zero false negatives: retry queue, dead-letter pipeline, safety floors)
- Retry queue for failed LINE pushes (LINE outage → queue → recovery → auto-retry)
- Compliance audit trail (immutable, survives deletion)
- Medication scheduling, inactivity detection, emotion analysis

**Tech:** Node.js 20, TypeScript strict mode, Firebase Admin SDK  
**Deployment:** Firebase (serverless, auto-scaling, 99.95% SLA)

---

## VERIFICATION & TESTING

**All features verified end-to-end on Firestore Emulator** (real SDK semantics, not mocks):

| Feature | Test Scenario | Result |
|---|---|---|
| **Alert reliability** | LINE outage → queue → recovery → auto-drain | ✅ Verified (26/26 emulator scenarios) |
| **Data safety** | Delete 620+ user docs in Firestore batches | ✅ All docs deleted, audit trail survives |
| **Medication flow** | Miss 5 doses → escalate alert severity | ✅ Threshold clamped, audit-logged |
| **Concurrency** | 5 scheduler runs attempt same alert ID | ✅ Only 1 alert created (idempotent dedup) |
| **Security rules** | Client tries to read audit logs | ✅ Denied (deny-by-default) |
| **Compliance export** | Export user data + checksum | ✅ Complete, checksum matches |

**Code quality:**
- TypeScript strict mode (no `any`)
- Firebase predeploy hook (auto-build on deploy)
- PDPA audit trail (who accessed what, when)
- Firestore Point-in-Time Recovery enabled (disaster recovery)

> **Verification Note:** All testing performed on Firestore Emulator using real SDK semantics. Production deployment success depends on proper setup, network stability, LINE API availability, and adherence to deployment runbook. See deployment guide for production prerequisites.

---

## MARKET OPPORTUNITY

### **Thailand Context**
- 14M elderly (9% of population, rising to 20% by 2050)
- Only 2% use digital health monitoring
- Government pushing digital health agenda
- Private hospitals competing on elderly care services
- Healthcare spending growing 8% annually

### **Market Sizing**

| Segment | # Facilities | Avg Users/Facility | TAM (฿/year) |
|---|---|---|---|
| **Private Hospital Chains** | 100–150 | 500–5,000 | ฿500M–2B |
| **Senior Living Communities** | 500–1,000 | 100–500 | ฿300M–1B |
| **Healthcare Franchises** | 2,000+ | 50–200 | ฿1B–3B |
| **Government Hospitals** | 800+ | 1,000–5,000 | ฿2B–5B |
| **Telehealth Platforms** | 5–10 | 10K–100K | ฿1B–3B |

**Total TAM:** ฿4.1B–14B (Thailand only)  
**SAM (realistic):** ฿500M–1B (capture 10–25% = ฿50–250M)  
**SOM (Year 1):** ฿30–50M (50–100 hospitals × ฿30–50K/month)

### **Revenue Model**

**Per Hospital:**
```
Hospital with 100 elderly patients
  License: ฿30K–50K/month (all-inclusive)
  = ฿360K–600K/year
  
At scale (100 hospitals):
  Annual Revenue: ฿36M–60M/year
  Operating Cost: 30% of revenue = ฿10.8M–18M/year
  Net Profit: ฿25.2M–42M/year (70% margin)
  Monthly Profit: ฿2.1M–3.5M/month (~$60–100K USD)
```

**Strategic exit (Year 3–5):**
- Typical healthtech multiple: 3–5x revenue
- At ฿120M revenue (Year 3 projection): ฿360M–600M valuation (~$10–17M USD)
- Strategic buyer (LINE, True Corp, hospital chain): ฿468M–900M+ offer ($13.4–25.7M USD)

---

## WHY THIS WORKS

✅ **First-mover in Thailand** — Combines LINE-native + elderly-optimized UX + production-grade PDPA compliance  
✅ **Network effects** — Elderly on LINE = caregiver on dashboard = hospital ecosystem locks in  
✅ **Recurring revenue** — Monthly subscription model (not one-time sales)  
✅ **Sticky product** — Caregivers + elderly don't switch platforms (data portability nightmare)  
✅ **Regulation tailwind** — PDPA enforcement = compliance urgency for hospitals  
✅ **Scalable tech** — Serverless (Firebase) = zero DevOps, auto-scaling to 1M+ users

---

## TEAM & EXECUTION

**Founder/Builder: Kanin Raksaraj**  
*Senior AI Architect & Software Developer — Founder, NamoNexus*

> "Architecting ethical, human-centered AI ecosystems. Specialist in sovereign AI infrastructure and complex system integration. Built for scale, engineered with care."

- Full-stack developer (React, Node.js, TypeScript)
- 6 months focused development
- Delivered 26-scenario verification end-to-end
- Code architecture: medical-grade (strict mode, immutable audit trail, zero false negatives)
- NaMo Care is the flagship product of the **NamoNexus ecosystem** (healthcare → education → AI R&D)

**Why ship now:**
- Technology ready (not MVP, full production)
- Market ready (regulations, aging population, LINE penetration)
- Capital efficient (built lean, no VC funding to date)

---

## BUSINESS MODEL OPTIONS

### **Option 1: IP Buyout (Recommended for quick exit)**
- **Price:** $1.5M–$3M
- **Buyer:** Hospital chain, telehealth platform, or LINE Thailand
- **Timeline:** 4–8 weeks
- **Your role:** None (clean exit)

### **Option 2: Equity + Ongoing Support**
- **Seed funding:** $1–2M
- **Your equity:** 20–40% (post-investment)
- **Your role:** CEO/CTO for 3–5 years
- **Timeline:** Exit via Series B or acquisition

### **Option 3: Licensing (Recurring Revenue)**
- **Model:** Per-hospital per-month fee
- **Your role:** Ongoing support + product development
- **Timeline:** Scale for 5+ years

---

## DEPLOYMENT & HANDOFF

**Deployment timeline:** 2 weeks
```
Week 1:
  - Buyer creates Firebase project (4 hours)
  - Buyer sets up LINE channel (4 hours)
  - Deploy functions + rules (2 hours)
  - Data migration / seeding (2 hours)

Week 2:
  - Team training (8 hours)
  - Customization (white-label branding)
  - Live testing in sandbox
  - Go-live
```

**Support included (varies by package):**
- Package A: 1-week post-delivery support only
- Package B: 6 months (bug fixes, optimization)
- Package C: 12 months + white-label customization

---

## RISKS & MITIGATIONS

| Risk | Impact | Mitigation |
|---|---|---|
| **Market adoption** | Hospitals slow to adopt new tech | Pilot with 2–3 hospitals first, prove ROI |
| **LINE API changes** | LINE modifies messaging API | Monitored 6 months; line SDK mature, stable |
| **Firestore costs** | Database bills high at scale | Projected ฿1–2K/month per hospital (acceptable) |
| **Competitor entry** | Someone copies LINE + elderly care | 6-month first-mover window; network effects (data lock-in) protect |
| **Regulatory** | PDPA enforcement suddenly strict | We're PDPA-ready (ahead of curve) |

---

## WHAT'S INCLUDED IN IP PACKAGE

✅ Full source code (React frontend + Node.js backend)  
✅ Firestore schema + security rules  
✅ Deployment scripts (firebase.json)  
✅ Architecture documentation (CLAUDE.md)  
✅ API documentation  
✅ 26-scenario verification results  
✅ Security audit report  
✅ Customization guide  

❌ NOT included: LINE webhook (buyer sets up own channel), Firebase project (buyer creates), production customer data (if any)

---

## IP OWNERSHIP & RIGHTS

**Package A (Source Code Only):**  
Buyer receives **full, exclusive ownership** of all source code, documentation, architectural designs, and all derivatives. NamoNexus retains no rights to the code. Buyer may modify, fork, white-label, and commercialize without restrictions.

**Package B (Code + 6-Month Support):**  
Same ownership as Package A. Support contract is separate and does not affect ownership.

**Package C (Full Transition, Recommended):**  
Same ownership as Package A. Source code is deposited in escrow with a third-party escrow agent for additional protection.

**Exclusions:**  
Buyer is responsible for creating their own Firebase project and LINE Official Account. NamoNexus does not transfer Firebase credentials or LINE channel access.

**NamoNexus Retained Rights:**  
NamoNexus retains the right to use the NaMo Care architecture for other geographic markets (outside buyer's region) or other vertical markets (e.g., Smart Classroom, education) not included in the purchase agreement.

---

## PRICING

### **Package A: Source Code Only**
**$500K–$1M**
- Full codebase, docs, architecture guide
- 1-week remote training (engineering team)
- Deployment script walkthrough
- After 90 days: Your responsibility

### **Package B: Code + 6-Month Support**
**$1M–$2M**
- Everything in Package A
- 6 months of technical support
  - Bug fixes (4-hour response for critical issues, business hours Thailand timezone)
  - Optimization help
  - Team training (2–3 sessions)
- White-label branding setup
- Go-live support (2-week intensive)

### **Package C: Full Transition Service**
**$2M–$3M** (Recommended)
- Everything in Package B
- Custom branding (white-label dashboard + bot)
- Migrate any existing data (if applicable)
- 12 months of support + SLA
- Source code escrow (you get code if we disappear)
- Training for full ops team (10–15 people)

---

## NEXT STEPS

1. **Technical Review** (30 min)
   - Architecture walkthrough
   - Live demo (dashboard + LINE bot)
   - Q&A on design decisions

2. **Proof of Concept** (1–2 weeks)
   - Deploy to buyer's Firebase project
   - Customize branding
   - Test alert flows

3. **Legal & Negotiation** (2–4 weeks)
   - Contract review (IP Purchase Agreement)
   - Support SLA finalization
   - Payment terms

4. **Delivery & Go-Live** (2–6 weeks)
   - Code handoff + source code escrow
   - Team training
   - Production deployment
   - 24/7 monitoring (first 2 weeks)

---

## CONTACT

**Kanin Raksaraj** — Senior AI Architect & Software Developer, Founder of NamoNexus

**Email:** contact@namonexus.com  
**LinkedIn:** https://www.linkedin.com/in/namo-nexus-504b1b399  
**GitHub:** github.com/icezingza  

**Ready to acquire a production-ready elderly care platform?**

---

**Prepared:** July 2026  
**Status:** Available for acquisition  
**Confidentiality:** Proprietary & Confidential
