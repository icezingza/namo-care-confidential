# SOURCE CODE ESCROW — IMPLEMENTATION GUIDE

**Package:** C (Full Transition)  
**Purpose:** Protect Buyer by holding verified copy of source code with neutral third party  
**Duration:** 12-month support term + 2 years after  

---

## 1. RECOMMENDED ESCROW SERVICES

### Option A: Escrow.com (Most Common)
- **Cost:** ~$500–$1,000 setup + $100–200/year maintenance
- **Website:** https://www.escrow.com
- **Contact:** info@escrow.com
- **Advantages:** Established, many healthcare clients, straightforward process
- **Process:** 
  1. Vendor + Buyer create joint escrow account
  2. Vendor deposits code to escrow
  3. Buyer verifies completeness
  4. Funds held until release trigger

### Option B: Iron Mountain Escrow
- **Cost:** ~$1,000–$2,000 setup + $200–300/year maintenance
- **Website:** https://www.ironmountain.com/services/escrow
- **Advantages:** Large, secure physical storage + digital
- **Best for:** High-value deals or additional privacy concerns

### Option C: DRC Technology (Specialized for Tech IP)
- **Cost:** ~$800–$1,500 setup
- **Website:** https://drc.tech
- **Advantages:** Tech-focused, understands code + dependencies
- **Best for:** Complex codebases with multiple dependencies

---

## 2. ESCROW DEPOSIT REQUIREMENTS

When depositing source code to escrow, include:

### Code & Documentation
```
namo-care-escrow/
├── src/                          # React frontend
│   ├── components/
│   ├── hooks/
│   ├── data/
│   ├── App.jsx
│   ├── firebase.js
│   ├── index.css
│   └── index.html
├── functions/src/                # Node.js backend
│   ├── webhook/
│   ├── handlers/
│   ├── schedulers/
│   ├── services/
│   ├── ai/
│   ├── notifications/
│   ├── utils/
│   ├── debug/
│   ├── types.ts
│   ├── config.ts
│   └── index.ts
├── firestore.rules               # Security rules
├── firestore.indexes.json        # Indexes
├── firestore.schema.md           # Schema documentation
├── firebase.json                 # Firebase config
├── package.json (root)           # Frontend dependencies
├── functions/package.json        # Backend dependencies
├── functions/tsconfig.json       # TypeScript config
├── CLAUDE.md                     # Architecture guide
├── README.md                     # Project overview
├── DEPLOYMENT_CHECKLIST.md       # Go-live checklist
├── DEPLOYMENT_RUNBOOK.md         # Step-by-step instructions
├── CUSTOMIZATION_GUIDE.md        # Branding + configuration
├── TROUBLESHOOTING_GUIDE.md      # Common issues + solutions
└── VERIFICATION_LOG.md           # 26-scenario test results
```

### Verification Checklist
```
✅ Source code is complete and compilable
✅ All dependencies listed in package.json
✅ Firestore rules are deploy-ready
✅ No hardcoded secrets (API keys, tokens, credentials)
✅ No "TODO" or "FIXME" comments in critical files
✅ Deployment scripts execute without errors
✅ Architecture documentation is current
✅ Build succeeds: npm run build (root + functions/)
✅ Linting passes: npm run lint
```

---

## 3. ESCROW TRIGGER EVENTS

Code is released to Buyer if:

### Trigger 1: Vendor Insolvency
- Vendor files for bankruptcy
- Vendor becomes insolvent (balance sheet test)
- Vendor is subject to foreclosure or asset seizure

**Verification:** Escrow agent requires court documents or creditor notification

### Trigger 2: Support Service Failure
- Buyer submits critical support request (via email with timestamp)
- Vendor fails to respond within 48 hours (business days)
- Vendor fails to provide workaround or fix within 14 days
- Buyer notifies escrow agent with evidence (email thread, screenshots)

**Verification:** Escrow agent confirms evidence and sends 7-day notice to Vendor to cure

### Trigger 3: Regulatory Action
- Vendor is subject to restraining order or injunction
- Vendor's business license is suspended
- Vendor is prosecuted for fraud or criminal conduct affecting contract

**Verification:** Escrow agent requires court documents

### Trigger 4: Vendor Request
- Vendor voluntarily releases code (e.g., selling business, retiring)

**Verification:** Vendor provides written release authorization

---

## 4. ESCROW RELEASE PROCESS

### Upon Trigger Event:

1. **Buyer files release request** with escrow agent (including evidence)
2. **Escrow agent notifies Vendor** of release request (7-day cure period if applicable)
3. **Vendor responds** (may dispute release if Trigger 2 — support failure)
4. **If no dispute:** Escrow agent verifies code completeness, then releases
5. **Release delivery:** Code is transferred to Buyer securely (encrypted download or physical storage)
6. **Escrow closes:** Account closed; remaining funds (if any) returned to Vendor

### Dispute Process (if Vendor contests release):

- If Vendor disputes, escrow agent arbitrates using contract language
- Typically: if Vendor failed to cure support request within 14 days, Vendor loses dispute
- If arbitration fails, court may need to decide (rare)

---

## 5. ESCROW COSTS & RESPONSIBILITY

### Setup Cost
- **Vendor pays:** 50% (Vendor wants protection for Buyer confidence)
- **Buyer pays:** 50% (Buyer benefits from escrow release)
- **Total:** ~$500–$1,500 (split equally)

### Annual Maintenance
- **Shared:** Split equally ($100–200/year per party)

### Release Cost
- **Buyer pays:** Cost of code transfer (usually included in annual fee)

---

## 6. CODE VERIFICATION REQUIREMENTS

Before depositing to escrow, both parties verify:

### Vendor Responsibility
- [ ] Code compiles without errors
- [ ] Build scripts are included
- [ ] No hardcoded secrets or API keys
- [ ] All dependencies documented
- [ ] Documentation is current and complete
- [ ] All source files included (no omissions)

### Buyer Responsibility (optional, recommended)
- [ ] Spot-check critical files (firestore.rules, lineWebhook function)
- [ ] Verify directory structure matches documentation
- [ ] Confirm build succeeds locally
- [ ] Review DEPLOYMENT_RUNBOOK for completeness

**Verification Sign-off:**
Both parties sign a checklist confirming code meets standards before escrow deposit.

---

## 7. IMPLEMENTATION TIMELINE

### T-0 (Contract Signing)
- IP Purchase Agreement + SOW signed
- Decision to proceed with Package C

### T+2 weeks (Go-Live)
- Deployment complete to Buyer's Firebase
- System operational

### T+3 weeks (Escrow Setup)
- Vendor contacts selected escrow agent
- Joint escrow account created
- Escrow agreement finalized

### T+4 weeks (Code Deposit)
- Vendor deposits verified code to escrow
- Buyer confirms receipt and completeness
- Escrow agent archives code
- 12-month support clock starts

### T+12 months
- Escrow maintenance continues
- Code held in escrow for additional 2 years after support ends

---

## 8. RECOMMENDED ESCROW AGREEMENT LANGUAGE (For IP Purchase Agreement)

```markdown
### Source Code Escrow (Package C only)

**8.1 Escrow Agent Selection**
Within 14 days of this agreement's effective date, the parties shall select 
and engage a third-party escrow service (e.g., Escrow.com, Iron Mountain) 
mutually agreeable to both parties.

**8.2 Code Deposit**
Vendor shall deposit to escrow:
- Complete, compilable source code of NaMo Care
- All build scripts, dependencies, and configuration files
- Architecture documentation and deployment runbooks
- Verification report confirming 26-scenario test passage
- List of all files included (manifest)

Escrow deposit must occur by T+4 weeks (4 weeks after this agreement's effective date).

**8.3 Verification**
Both parties shall jointly verify escrow contents within 10 days of deposit. 
Buyer may request re-deposit if code is incomplete or non-functional.

**8.4 Release Triggers**
Code is released to Buyer if any of the following occur:
- Vendor becomes insolvent or bankrupt
- Vendor fails to respond to critical support request within 48 hours (business)
- Vendor fails to provide fix/workaround within 14 days of support request
- Vendor is subject to regulatory action affecting operations
- Vendor voluntarily releases code

**8.5 Release Process**
Upon release trigger, Buyer submits release request with evidence. 
Escrow agent notifies Vendor (7-day cure period if applicable). 
If Vendor does not cure, code is released to Buyer within 5 business days.

**8.6 Escrow Costs**
Setup costs (~$500–$1,500) and annual maintenance (~$100–200) are split equally 
between Vendor and Buyer. Costs are separate from IP purchase price.

**8.7 Escrow Duration**
Code remains in escrow for 12-month support term plus 24 months thereafter 
(total 36 months minimum).
```

---

## 9. COMMUNICATION TEMPLATE FOR ESCROW SETUP

**Email from Vendor to Buyer (upon contract signing):**

```
Subject: Next Step — Source Code Escrow Setup (Package C)

Hi [Buyer Contact],

To complete our Package C agreement, we need to set up source code escrow 
with a third-party agent within 2 weeks.

I recommend Escrow.com (established, transparent, many tech clients). 
They charge ~$500 setup + ~$100/year maintenance (split 50/50).

Please confirm:
1. Are you OK with Escrow.com, or do you have another preference?
2. Who should be the primary contact for escrow communications?
3. What's your preferred escrow completion date?

Once you confirm, I'll reach out to Escrow.com to initiate the account.

Best regards,
Kanin
```

---

## 10. CHECKLIST FOR PACKAGE C CLOSING

- [ ] IP Purchase Agreement signed
- [ ] SOW signed
- [ ] Payment 50% received
- [ ] Source code delivered to Buyer's Firebase
- [ ] Go-live complete and stable (2+ weeks)
- [ ] Escrow agent selected and account created
- [ ] Code deposited to escrow
- [ ] Both parties verify code completeness
- [ ] Escrow agreement executed
- [ ] 12-month support period begins
- [ ] Payment 50% released from escrow/received

---

**Document Status:** Reference guide — Use when closing Package C deals  
**Last Updated:** July 2026
