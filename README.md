# namo-care-confidential — Private Data Room

**Status:** Ready to populate  
**Repository:** https://github.com/icezingza/namo-care-confidential  
**Visibility:** Private (for identified prospects only)  
**Confidentiality:** Proprietary & Confidential — Distribution: For identified recipients only

---

## 📂 Directory Structure

```
namo-care-confidential/
├── README.md (this file)
├── 01_ONE_PAGER.md
├── 02_EXECUTIVE_SUMMARY.md
├── 03_TECHNICAL_SPEC.md
├── 04_SECURITY_COMPLIANCE.md
├── 05_OUTREACH_EMAIL_TEMPLATES.md
├── 06_TARGET_BUYER_DATABASE.md
├── 07_PITCH_DECK_OUTLINE.md
├── 08_LAUNCH_ACTION_PLAN.md
├── 09_OPERATIONS_GUIDE.md
├── 10_NAMONEXUS_OVERVIEW.md
├── 11_BUYER_FAQ.md
├── 00_MASTER_CHECKLIST.md
├── IP_PURCHASE_AGREEMENT_TEMPLATE.md
├── NDA_TEMPLATE.md
├── SOW_TEMPLATE.md
├── SOURCE_CODE_ESCROW_REFERENCE.md
└── UPLOAD_INSTRUCTIONS.md (step-by-step guide)
```

---

## 🔐 Security & Access Control

### Who Can Access This Repository?
- ✅ **Identified prospects** — Companies seriously evaluating NaMo Care acquisition
- ✅ **Their legal teams** — For contract review
- ✅ **Their technical teams** — For technical evaluation
- ✅ **Investors** — For due diligence (under NDA)
- ✅ **Founder/NamoNexus team** — For management

### How Access Is Controlled
1. **Private GitHub repository** — Not listed in search, not discoverable
2. **Access by invitation only** — Add prospects as collaborators
3. **No public links** — Share repo URL privately via email
4. **Audit trail** — GitHub tracks who accessed what, when

### What NOT to Share Publicly
- ❌ This repository URL (share privately only)
- ❌ Individual file links (send ZIP or invite to repo instead)
- ❌ Screenshots containing financial projections
- ❌ Buyer contact database (06_TARGET_BUYER_DATABASE.md)
- ❌ Internal notes or negotiation terms

---

## 📋 Document Guide

### For Initial Outreach (Send via Email)
1. **01_ONE_PAGER.md** — Start here. 1 page, high-level overview.

### For Evaluation Phase (Invite to Private Repo)
2. **02_EXECUTIVE_SUMMARY.md** — 8 pages, detailed product + market overview
3. **04_SECURITY_COMPLIANCE.md** — Security audit, PDPA compliance proof
4. **11_BUYER_FAQ.md** — Answers to common questions
5. **03_TECHNICAL_SPEC.md** — Architecture, tech stack, deployment requirements

### For Legal Review (Template Docs)
6. **IP_PURCHASE_AGREEMENT_TEMPLATE.md** — Customize per deal
7. **NDA_TEMPLATE.md** — Use before sharing confidential details
8. **SOW_TEMPLATE.md** — Statement of work with support SLAs
9. **SOURCE_CODE_ESCROW_REFERENCE.md** — Escrow setup guide (Package C only)

### For Strategic Partners & Investors
10. **10_NAMONEXUS_OVERVIEW.md** — Ecosystem positioning
11. **07_PITCH_DECK_OUTLINE.md** — 18-slide deck framework

### For Operations & Sales Team
12. **05_OUTREACH_EMAIL_TEMPLATES.md** — 7 email templates (Tier 1–4 prospects)
13. **06_TARGET_BUYER_DATABASE.md** — Contact list with tiers & outreach strategy
14. **08_LAUNCH_ACTION_PLAN.md** — Week-by-week execution plan
15. **09_OPERATIONS_GUIDE.md** — Deployment runbook for buyers
16. **00_MASTER_CHECKLIST.md** — Pre-launch verification checklist

---

## 🚀 How to Use This Repository

### Step 1: Email 1 to Prospects (Initial Contact)
1. Personalize **Email 1** from `05_OUTREACH_EMAIL_TEMPLATES.md`
2. Attach **01_ONE_PAGER.md** (or copy-paste content)
3. Ask prospect: _"May I share the full evaluation package?"_

### Step 2: Follow-Up (Share This Repo)
Once prospect shows interest:
1. Under NDA, add them as a **"Collaborator"** to this private repo
2. Send: _"Here's our complete evaluation package (private repo). Your team can review asynchronously."_
3. Provide repo URL: `https://github.com/icezingza/namo-care-confidential`

### Step 3: Answer Questions (Document-First)
1. Prospect emails questions → Answer with document excerpts or email
2. If new question type → Add to **11_BUYER_FAQ.md** for future use
3. Maintain 24-hour response SLA (async-first communication model)

### Step 4: Proof-of-Concept (Optional)
1. Prospect wants to test → Deploy to their Firebase sandbox
2. Use **09_OPERATIONS_GUIDE.md** as shared deployment runbook
3. Offer 1-week PoC support (technical, written)

### Step 5: Legal & Negotiation
1. Prospect's legal reviews contracts
2. Use **IP_PURCHASE_AGREEMENT_TEMPLATE.md** as starting point
3. Customize per deal structure (Package A/B/C, pricing, support terms)

### Step 6: Handoff & Escrow
1. For Package C: Initiate source code escrow (see **SOURCE_CODE_ESCROW_REFERENCE.md**)
2. Follow **09_OPERATIONS_GUIDE.md** for deployment to buyer's Firebase
3. Deliver full source repo + documentation

---

## 📊 Access & Sharing Workflow

```
Timeline → Action → Who → Document
─────────────────────────────────
Day 0    → Send Email 1           → Prospect → 01_ONE_PAGER.md
Day 3    → Follow-up if no open   → Prospect → Email 2 (follow-up)
Day 7    → Invite to private repo → Prospect → Full package
Day 14   → Answer Q&A (async)     → Legal    → 11_BUYER_FAQ.md
Day 21   → Proof-of-Concept       → Tech     → 09_OPERATIONS_GUIDE.md
Day 35   → Contract negotiation   → Legal    → IP_PURCHASE_AGREEMENT_TEMPLATE.md
Day 42   → Signed + Escrow setup  → Ops      → SOURCE_CODE_ESCROW_REFERENCE.md
Day 56   → Deploy & go-live       → Tech     → 09_OPERATIONS_GUIDE.md
```

---

## 🔒 Confidentiality Checklist

Before sharing this repo with a prospect:

- [ ] Prospect has signed NDA (use `NDA_TEMPLATE.md` if not)
- [ ] Added as GitHub collaborator (not public access)
- [ ] Shared repo URL via email only (never public links)
- [ ] Confirmed their legal team will review under NDA
- [ ] Documented who has access (maintain access log)
- [ ] Set GitHub notification to "Notify on all activity" (track their access)

---

## 🛠 Managing Collaborators

### Add a New Prospect to the Repo

1. **GitHub Settings** → **Collaborators** → **Add collaborator**
2. Enter their GitHub username (or email)
3. Select permission level: **"Read"** (not write)
4. Send email: _"I've invited you to our private repository..."_
5. Record in access log (see below)

### Remove Access (If Deal Falls Through)

1. **GitHub Settings** → **Collaborators** → Remove their name
2. Document: "Removed [Company] access on [Date]"
3. Confirm: GitHub email notifies them of removal

### Access Log Template (Maintain Separately)

```
Company | Contact | Date Added | Date Removed | Status
─────────────────────────────────────────────────────
LINE Thailand | Noppadol | 2026-07-20 | — | Active
True Corp | Somchai | 2026-07-22 | 2026-08-10 | Removed (deal fell through)
MedThai | Darin | 2026-07-25 | — | Active
```

---

## 📞 Contact & Support

**Questions about documents?**  
→ Email: contact@namonexus.com  
→ Response time: Within 24 hours

**Technical questions?**  
→ Refer to **03_TECHNICAL_SPEC.md** or **11_BUYER_FAQ.md** first  
→ If not answered: Email with specific question

**Legal/Negotiation?**  
→ Use **IP_PURCHASE_AGREEMENT_TEMPLATE.md** as starting point  
→ Lawyer-to-lawyer negotiation (Kanin available for calls if needed)

---

## ✅ Pre-Launch Checklist (Before First Prospect Invite)

- [ ] Repository created ✅ (you've done this)
- [ ] README.md added (this file)
- [ ] All 16 documents uploaded
- [ ] .gitignore created (prevent accidental commits of sensitive files)
- [ ] Branch protection enabled (prevent accidental deletion)
- [ ] Access log spreadsheet created (track who has access)
- [ ] First prospect identified for Email 1 outreach
- [ ] Email template personalized (use `05_OUTREACH_EMAIL_TEMPLATES.md`)
- [ ] NDA signed by prospect (or ready to send)
- [ ] First prospect invited as collaborator

---

## 🚨 Emergency: Accidental Public Exposure

**If the repo is accidentally made public:**

1. **Immediately:** Set back to **Private** (GitHub Settings → Visibility)
2. **Within 1 hour:** 
   - Rotate all secrets (Firebase, LINE credentials) if any were accidentally exposed
   - Alert all collaborators
   - Document incident
3. **Follow-up:** Review git history to confirm no secrets in commits

---

## 📝 Document Maintenance

### Update Frequency
- **Every month:** Review documents for outdated info (pricing, timelines)
- **After every deal:** Update FAQ with new questions
- **Quarterly:** Security audit refresh

### Version Control
Documents are NOT versioned in this repo (no v1.0, v1.1 files). Instead:
- Keep single master version of each document
- GitHub tracks change history automatically
- Use GitHub "Blame" to see who changed what, when

---

**Repository created:** July 2026  
**Last updated:** July 2026  
**Confidentiality:** Proprietary & Confidential — Distribution: Private Collaborators Only  
**Managed by:** Kanin Raksaraj (NamoNexus)

---

For questions about accessing or managing this repository, contact: contact@namonexus.com
