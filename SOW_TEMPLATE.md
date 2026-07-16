# STATEMENT OF WORK (SOW) TEMPLATE

**For:** NaMo Care Platform Deployment & Support  
**Effective Date:** [DATE]  
**Client:** [BUYER COMPANY NAME]  
**Vendor:** NamoNexus / Kanin Raksaraj  
**Package:** [A / B / C]  

---

## 1. EXECUTIVE SUMMARY

This Statement of Work defines the scope of services, timeline, and deliverables for the NaMo Care deployment and support engagement. Client will receive the NaMo Care codebase (React dashboard + LINE Bot) with deployment support and team training.

---

## 2. SCOPE OF WORK

### 2.1 Deliverables

**All Packages Include:**
- Full source code (React frontend + Node.js backend)
- Firestore schema and security rules
- Deployment scripts and firebase.json
- Architecture documentation (CLAUDE.md)
- Technical specification and API guide
- Security & compliance audit report
- Deployment runbook (step-by-step instructions)

**Package B/C Additional:**
- White-label customization (logo, colors, branding)
- Extended team training (2–3 sessions for Package B; 4+ for Package C)
- Go-live support (2-week intensive period)
- 6-month (Package B) or 12-month (Package C) support + bug fixes

**Package C Only:**
- Full ops team training (10–15 people)
- Data migration assistance (if applicable)
- Source code escrow arrangement with third-party agent
- Custom SLA agreements

### 2.2 Scope Exclusions

This SOW does NOT include:

- Creation of Client's Firebase project (Client responsibility)
- Setup of Client's LINE Official Account and channel credentials
- Migration of existing production customer data
- Custom feature development or modifications
- Third-party integrations (HIS, EMR, external APIs)
- Hosting infrastructure setup beyond deployment scripts
- Post-launch feature enhancements beyond standard support

### 2.3 Assumptions

- Client has a dedicated technical team (2–3 engineers) available for training
- Client's IT environment has reliable internet and HTTPS connectivity
- Client's Firebase project will be created in asia-southeast1 (Bangkok) region
- Client will designate admin and support team for post-deployment operations

---

## 3. TIMELINE

### Package A: 2 Weeks
```
Week 1:
  Day 1: Source code delivery + architecture walkthrough
  Day 2-3: Client technical review
  Day 4-5: Deployment to Client's Firebase (guided)
  Day 7: Deployment complete; basic support ends

Week 2:
  Days 8-14: Client self-support (questions answered)
```

### Package B: 4 Weeks (includes deployment + initial training)
```
Week 1: Deployment Setup
  Day 1-2: Firebase + LINE channel setup (Client leads, Vendor assists)
  Day 3: Deploy functions and Firestore rules
  Day 4-5: Seed demo data; live environment testing
  Day 7: Deployment complete

Week 2: Team Training
  Day 8-9: Engineering team training (8 hours)
  Day 10-11: Customization planning (logo, white-label setup)
  Day 14: Training complete

Week 3: Go-Live Preparation
  Day 15-16: White-label branding customization
  Day 17-18: Staging environment testing
  Day 21: Go-live readiness assessment

Week 4: Go-Live Support
  Day 22-28: 24-hour monitoring + issue response
```

### Package C: 6 Weeks (includes Package B + 12-month support onboarding)
```
Weeks 1-4: Same as Package B

Weeks 5-6: Ops Team Training
  Day 29-35: Full operations team training (10-15 people)
  Day 36-42: Deployment runbook walkthrough
  Day 42: Source code escrow established; 12-month support begins
```

---

## 4. DELIVERABLE DETAILS

### 4.1 Source Code Delivery

**Format:** GitHub private repository (with Vendor's temporary access) or ZIP archive

**Contents:**
- `/src/` — React 19 frontend (components, hooks, data)
- `/functions/src/` — Node.js 20 backend (handlers, schedulers, services)
- `/firestore.rules` — Security rules (deploy-ready)
- `/firestore.indexes.json` — Composite indexes
- `/firebase.json` — Deployment configuration
- `/package.json` — Dependencies
- `CLAUDE.md` — Architecture & coding standards
- `README.md` — Project overview
- Deployment guide with exact CLI commands

### 4.2 Training Deliverables

**Package A:** 1-week remote training (async email support)

**Package B:** 2-3 training sessions
- Session 1: Architecture overview + Firestore schema walkthrough
- Session 2: Cloud Functions and LINE Bot integration
- Session 3: Deployment procedures and troubleshooting

**Package C:** Full ops team training (10-15 people)
- Session 1: System administrators (Firebase, infrastructure)
- Session 2: Application support (alerts, users, configuration)
- Session 3: PDPA & compliance procedures (breach notification, data deletion)
- Session 4: Monitoring and maintenance (logs, performance, scaling)
- Provided in Thai + English

### 4.3 Support Deliverables

**Package B (6 months):**
- Email-based technical support (4-hour response for critical)
- Bug fixes and patches
- Optimization recommendations
- Go-live support (2-week intensive)

**Package C (12 months):**
- Extended support with SLA guarantees
- Source code escrow with third-party agent
- Quarterly performance reviews
- Proactive monitoring and optimization
- Training refresher sessions (optional)

---

## 5. ACCEPTANCE CRITERIA

The engagement is considered "complete" and "accepted" when:

✅ Source code is delivered in full and compiles without errors  
✅ Firestore rules deploy successfully to Client's Firebase project  
✅ Cloud Functions deploy and execute without errors  
✅ Demo data seeds successfully; alert flow works end-to-end  
✅ Client team completes training and demonstrates basic operations  
✅ Go-live readiness assessment confirmed (Package B/C)  
✅ All critical issues identified during testing are resolved  

**Acceptance Timeline:** Client has 14 days from delivery to confirm acceptance; any issues must be reported within this period.

---

## 6. SUPPORT & ISSUE RESOLUTION

### 6.1 Issue Classification

**Critical:**
- Security breach or vulnerability discovered
- Firestore down or inaccessible
- LINE webhook non-functional
- Alert system not working

**Response:** 4 hours (business hours, Thailand timezone) or next business day

**High Priority:**
- Performance degradation
- Data export/deletion procedures not working
- Custom branding not applying correctly

**Response:** 24 hours (best effort)

**Medium/Low:**
- Feature enhancement requests
- Configuration questions
- Performance optimization

**Response:** Best effort within 7 days

### 6.2 Support Channel

All support is delivered via email (contact@namonexus.com) or ticketing system (if applicable). Response time clock starts upon email receipt; acknowledgment emails count as "response."

### 6.3 Support Exclusions

Support does NOT cover:
- Custom feature development
- Third-party integration troubleshooting
- Client's infrastructure issues (Firebase billing, network problems, etc.)
- User training or support
- Data migration from legacy systems

---

## 7. CHANGE MANAGEMENT

### 7.1 Out-of-Scope Request Process

If Client requests work outside this SOW:

1. Client submits detailed request to Vendor
2. Vendor evaluates and responds with:
   - Estimated effort (hours)
   - Revised timeline (if applicable)
   - Additional cost (if applicable)
3. Client approves or declines via written confirmation
4. Approved changes are documented in a change order

### 7.2 Change Order Template

```
Change Request #: ___
Date: ___
Description: [what Client is requesting]

Effort: __ hours
Cost: $__ (or included in current scope)
Timeline Impact: __ days
Approval: ___ (Client signature)
```

---

## 8. PAYMENT TERMS

**Total Project Cost:** $[Amount] + optional support renewal

**Payment Schedule:**
- 50% ($__) upon SOW signature
- 50% ($__) upon acceptance of deliverables

**Payment Method:**  
- Bank transfer (USD to Vendor's account)
- Due within [NET 30] days of invoice

**Late Fees:**  
1.5% per month if payment overdue

**Cancellation:**  
If Client cancels before completion, Client forfeits all fees (no refunds).

---

## 9. RESPONSIBILITIES

### Vendor's Responsibilities
- Provide source code in agreed format
- Conduct training sessions as scheduled
- Respond to support requests within SLA
- Document known issues and workarounds
- Provide deployment guidance and troubleshooting

### Client's Responsibilities
- Create Firebase project and LINE channel
- Allocate team members for training
- Implement deployment steps (with Vendor guidance)
- Configure white-label branding and custom settings
- Manage data backup and disaster recovery (after go-live)
- Handle user support and data protection compliance
- Notify Vendor of critical issues

---

## 10. COMMUNICATION & ESCALATION

**Regular Communication:**
- Weekly status emails (Package B/C during deployment)
- Escalation path for critical issues
- Monthly check-ins (Package C only, after go-live)

**Contact Information:**
- Vendor: contact@namonexus.com
- Client Point of Contact: [Name, Title, Email, Phone]

---

## 11. CONFIDENTIALITY

Both parties agree to:
- Keep this SOW and pricing confidential
- Not disclose deployment details to competitors
- Comply with NDA (separate document) for pre-delivery materials
- Not publicize the relationship without mutual consent

---

## 12. TERM & TERMINATION

**Term:**  
This SOW is effective from [Start Date] and concludes upon acceptance of all deliverables (typically [End Date]).

**Termination for Cause:**  
Either party may terminate if:
- The other party materially breaches and fails to cure within 14 days
- Circumstances make performance impossible

**Effect of Termination:**  
- Client retains all deliverables already received (codebase, training materials)
- Vendor's post-delivery support obligations end
- Payment obligations are pro-rated

---

## 13. LIABILITY & INDEMNIFICATION

**Limitation:**  
Neither party is liable for indirect or consequential damages (lost profits, lost data, etc.). Liability is capped at the total amount paid under this SOW.

**Indemnification:**  
Vendor indemnifies Client against third-party claims that the Software infringes IP rights (excluding Client-made modifications or misuse).

---

## 14. SIGNATURES

**CLIENT:**

___________________________  
[Authorized Representative Name]  
[Authorized Representative Title]  
[Client Company]  
Date: ___________________

**VENDOR:**

___________________________  
Kanin Raksaraj  
NamoNexus  
Date: ___________________

---

**Document Status:** Template — Customize per Client and Package type  
**Last Updated:** July 2026
