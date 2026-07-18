# NaMo Care — Buyer FAQ

**Purpose:** Written answers to every question buyers typically ask — attach this document (or copy individual answers) instead of scheduling calls.  
**Communication model:** Document-first. All inquiries answered in writing within 24 hours via contact@namonexus.com  
**Date:** July 2026  
**Confidentiality:** Proprietary & Confidential

---

## 📋 How We Work (Read This First)

**NamoNexus operates async-first and document-first.** All evaluation, Q&A, and negotiation happen in writing — email, shared documents, and (under NDA) a private data room.

Why this benefits you as a buyer:
- ✅ **Every answer is written and referenceable** — nothing gets lost or misremembered from a call
- ✅ **Your whole team evaluates on its own schedule** — no calendar coordination across departments
- ✅ **Written answers become contract exhibits** — technical claims made in writing are commitments, not sales talk
- ✅ **24-hour response SLA** on all questions during evaluation

If your process eventually requires a live meeting (e.g., final signing ceremony), a representative can attend on NamoNexus's behalf.

---

## 1. Product & Status

**Q: What exactly is NaMo Care?**  
A production-ready elderly care platform for Thailand: a React web dashboard for caregivers + a LINE Bot for elderly users (no app install), on a shared Firestore backend. Core capabilities: medication reminders, inactivity detection, emotion analysis, SOS emergency flow, and a medical-grade alert engine.

**Q: Is this an MVP or a finished product?**  
Finished and verified. 53/53 end-to-end scenarios pass on the Firestore emulator (real SDK semantics, not mocks), including LINE-outage recovery, concurrent-scheduler deduplication, and 620-document batch deletion. An independent security audit found 0 critical vulnerabilities.

**Q: Does it have live users/customers today?**  
The platform is deployment-ready. It has not been sold to a hospital yet — that is exactly the opportunity: you acquire proven technology without a competitor's installed base to fight, and without 6–12 months of R&D.

**Q: What does "zero false negatives" mean?**  
The alert engine is engineered so a critical alert (SOS, emergency keyword) can never be silently dropped: failed LINE pushes enter a retry queue with exponential backoff, unrecoverable messages land in a dead-letter collection for manual follow-up, and alert-threshold settings are clamped to safety floors so no configuration can suppress a critical alert.

---

## 2. Technical

**Q: What is the tech stack?**  
Frontend: React 19, Vite 7, Tailwind CSS 4. Backend: Node.js 20, TypeScript (strict mode), Firebase Cloud Functions, Firestore. Messaging: LINE Bot SDK 9.7. Deployment: Firebase (serverless).

**Q: Why Firebase? Can we migrate to our own infrastructure?**  
Firebase gives serverless auto-scaling (to 1M+ users), a 99.95% SLA, and zero DevOps overhead — a hospital IT team can operate it without hiring. All Firestore access is isolated behind service layers (`firestoreService.ts`, `firebase.js`), so a future migration to another database touches a small, well-defined surface.

**Q: How dependent is the product on LINE?**  
LINE is the elderly-facing channel by design (45M+ Thai users — the entire product advantage). The notification layer is multi-channel: the architecture already includes SMS gateway adapters and in-app notifications as fallbacks.

**Q: Can we white-label / rebrand it?**  
Yes. Packages B and C include white-label setup (your logo, colors, LINE Official Account, domain). The design system is token-based (CSS variables), so rebranding is configuration, not rewriting.

**Q: How many concurrent users can it handle?**  
Firestore and Cloud Functions scale automatically. Projected infrastructure cost is ฿1–2K/month per hospital (~100 elderly users each); no re-architecture is needed until well past 100,000 users.

**Q: Can we review the source code before buying?**  
Yes — under NDA, through a private data room: representative source samples, the full architecture documentation, verification logs, and the security audit. Full repository access transfers at contract signing (with source code escrow available in Package C).

---

## 3. Security & Compliance

**Q: Is it PDPA-compliant?**  
Yes, by design: immutable audit trail (`complianceAuditTrail` — survives even user deletion), data export with SHA-256 checksum (Article 20-equivalent portability), two-step tokenized deletion (request → confirm → execute), rate limiting, and role-based access via Firebase custom claims.

**Q: Has it been security-audited?**  
Yes — a documented audit covering the 7 security-critical files: 0 critical vulnerabilities, 12/12 Firestore security-rules test cases pass (deny-by-default on all audit collections), no hardcoded secrets, HMAC-SHA256 LINE webhook signature verification, OWASP Top 10 mitigations mapped. The full report (`SECURITY_AUDIT_REPORT.md`) is included in the package.

**Q: What about disaster recovery?**  
Firestore Point-in-Time Recovery (7-day window) is documented as a required pre-go-live step, with exact console/gcloud commands in the operations guide. Data-retention policies are automated (90-day alert logs, 180-day conversations).

---

## 4. Commercial

**Q: What are the pricing options?**

| Package | Price | Includes |
|---|---|---|
| **A — Source Code** | $500K–$1M | Full codebase, docs, deployment scripts, 1-week training |
| **B — Code + Support** | $1M–$2M | A + 6-month support, white-label setup, go-live assistance |
| **C — Full Transition** (recommended) | $2M–$3M | B + 12-month SLA, data migration, source escrow, full ops-team training |

**Q: Who owns the IP after purchase?**  
You do. Package A/B/C all include **full, exclusive ownership** of all source code, documentation, and derivatives. NamoNexus retains no rights to the code. You can modify, fork, white-label, and commercialize without restriction. Package C adds source code escrow with a third-party agent for additional protection. NamoNexus retains only the right to use the architecture for other geographic regions or unrelated products (e.g., education).

**Q: Are prices negotiable? What about revenue-share instead of buyout?**  
Yes. Alternative structures we'll consider in writing: white-label licensing (upfront + 15–20% revenue share), integration partnership (50/50 or 80/20 split), and equity arrangements for earlier-stage partners. Tell us your preferred structure by email and we'll respond with a term sheet draft.

**Q: What is NOT included?**  
Your Firebase project (you create it — ~4 hours), your LINE Official Account channel (~4 hours), and any existing production customer data. The deployment guide covers both setup steps.

**Q: Why is the founder selling?**  
NaMo Care is the flagship of the NamoNexus ecosystem (healthcare → education → AI R&D). The founder is an architect-builder, not a hospital sales organization — the product's market potential is best realized by a buyer with existing healthcare distribution. This is a strength: you get clean IP, complete documentation, and a motivated technical counterpart, not a competitor.

---

## 5. Deployment & Handoff

**Q: How long from contract to go-live?**  
2 weeks standard: Week 1 — Firebase + LINE channel setup, deploy functions/rules, seed data. Week 2 — team training, sandbox testing, white-label branding, production cutover.

**Q: What training is included?**  
Package A: 1-week remote engineering training. Package B: + 2–3 additional sessions. Package C: full ops-team training (10–15 people) using the included operations guide (deployment runbook, log analysis, troubleshooting, PDPA procedures — written in Thai for hospital IT staff).

**Q: What does post-sale support look like?**  
Written/async support with defined SLAs: critical bug response within 4 hours (business hours, Thailand timezone) or next business day (Packages B/C). All support is delivered via email/ticket — which means every fix and answer is documented for your team permanently. Critical defined as: security breach, infrastructure down, webhook non-functional.

**Q: What happens if NamoNexus disappears?**  
Package C includes source code escrow: you hold a complete, buildable copy of the code independent of us. The codebase also has no proprietary runtime dependencies — it runs on standard Firebase.

---

## 6. Evaluation Process (Step by Step)

1. **Request the evaluation package** (email contact@namonexus.com) → receive within 24 hours: technical spec, security audit, verification results, recorded demo video, this FAQ
2. **Written Q&A** — send questions in any format; answers within 24 hours
3. **NDA + data room** — for serious buyers: source samples, full architecture docs, emulator verification logs
4. **Proof-of-concept** (optional, 1–2 weeks) — deploy to YOUR Firebase sandbox with our written runbook support
5. **Term sheet → contract → handoff** — all negotiated in writing; legal review on your side proceeds in parallel

**Typical timeline: 4–8 weeks from first email to signed contract.**

---

## Contact

**Kanin Raksaraj** — Senior AI Architect & Software Developer, Founder of NamoNexus

📧 **contact@namonexus.com** — all inquiries answered in writing within 24 hours  
🔗 https://www.linkedin.com/in/namo-nexus-504b1b399  
💻 github.com/icezingza

*"Human-centered AI, engineered with care."*

---

**Prepared:** July 2026  
**Status:** Living document — updated as buyer questions arrive  
ด้วยความเมตตาครับ 🙏
