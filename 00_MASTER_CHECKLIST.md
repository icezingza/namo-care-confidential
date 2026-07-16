# NaMo Care IP Sales Package — Master Checklist

**Status:** Preparing for market (Complete by 2026-07-20)

---

## ✅ PHASE 1: Code Cleanup & Documentation (Days 1–3)

- [ ] **Remove all secrets & credentials**
  - [ ] Grep for PASSWORD, TOKEN, SECRET, API_KEY in all code
  - [ ] Remove LINE channel secret (if any remained)
  - [ ] Remove Firebase credentials from comments
  - [ ] Remove test database IDs
  - [ ] Run: `grep -r "PASSWORD\|TOKEN\|SECRET\|KEY" functions/ src/`

- [ ] **Clean up test/debug code**
  - [ ] Remove `functions/src/debug/localTestEndpoints.ts` (mark for removal or document as dev-only)
  - [ ] Clean mock data from `src/data/`
  - [ ] Remove test comments marked "TODO", "FIXME", "DEBUG"
  - [ ] Keep only production-grade code

- [ ] **Verify build & lint**
  - [ ] `npm run lint` (root)
  - [ ] `cd functions && npm run build` (no TypeScript errors)
  - [ ] `cd functions && npm run lint`
  - [ ] `npm run build` (frontend)

- [ ] **Create IP package tarball**
  ```bash
  tar -czf namo-care-ip-complete.tar.gz \
    functions/src \
    functions/tsconfig.json \
    functions/package.json \
    src/ \
    firestore.rules \
    firestore.schema.md \
    firebase.json \
    CLAUDE.md \
    DEPLOYMENT_GUIDE.md \
    README.md \
    package.json
  ```

- [ ] **Create .gitignore for handoff**
  - [ ] Ensure `.env*` is ignored
  - [ ] Ensure `node_modules/` is ignored
  - [ ] Document: "Buyer creates own Firebase project & LINE channel"

---

## ✅ PHASE 2: Sales Documents (Days 4–5)

### **2.1 One-Pager (CRITICAL)**
- [ ] **File:** `IP_SALES_PACKAGE/01_ONE_PAGER.md`
- [ ] Content:
  - Logo + title
  - Problem (14M Thai elderly, 2% digital adoption)
  - Solution (3-bullet summary)
  - Market (TAM/SAM/SOM)
  - Price range ($1.5M–$3M)
  - Contact + CTA

### **2.2 Executive Summary (2 pages)**
- [ ] **File:** `IP_SALES_PACKAGE/02_EXECUTIVE_SUMMARY.pdf`
- [ ] Includes:
  - What is NaMo Care
  - Key features (dashboard, LINE bot, alerts)
  - Verification results (26/26 scenarios)
  - Target market
  - Deployment timeline (2 weeks)
  - Pricing model

### **2.3 Technical Specification**
- [ ] **File:** `IP_SALES_PACKAGE/03_TECHNICAL_SPEC.md`
- [ ] Includes:
  - Tech stack (React 19, Firebase, Node.js 20, LINE SDK)
  - Architecture diagram (ASCII or image)
  - Database schema (Firestore collections)
  - Security rules summary
  - API endpoints (if white-labeling)
  - Deployment requirements (Firebase project, billing)

### **2.4 Security & Compliance**
- [ ] **File:** `IP_SALES_PACKAGE/04_SECURITY_COMPLIANCE.md`
- [ ] Includes:
  - PDPA compliance checklist (✓ audit trail, ✓ two-step deletion, ✓ data export)
  - Data encryption (at rest + in transit)
  - Firestore rules audit results (12-case matrix passed)
  - Disaster recovery (PITR enabled)
  - Audit trail immutability proof
  - Code review findings (0 critical, 0 high)

### **2.5 System Requirements**
- [ ] **File:** `IP_SALES_PACKAGE/05_SYSTEM_REQUIREMENTS.md`
- [ ] Includes:
  - Firebase setup (project, billing, quotas)
  - Node.js version (20+)
  - Browser support (modern Chrome, Safari, Edge)
  - LINE channel setup
  - Network/bandwidth requirements
  - Infrastructure costs (~$500–$2K/month at scale)

### **2.6 Pricing & Licensing**
- [ ] **File:** `IP_SALES_PACKAGE/06_PRICING_LICENSE.md`
- [ ] Options:
  - **Package A (Code-only):** $500K–$1M
  - **Package B (Code + 6-month support):** $1M–$2M
  - **Package C (Full transition):** $2M–$3M
  - License terms (exclusive, non-exclusive, regional)

---

## ✅ PHASE 3: Demo & Walkthrough Materials (Days 6–7)

### **3.1 Demo Video (3–5 minutes)**
- [ ] **File:** `IP_SALES_PACKAGE/demo_video.mp4`
- [ ] Scenes:
  1. Dashboard overview (caregiver sees elderly user)
  2. Emergency alert triggered (SOS flow)
  3. LINE bot receiving alert
  4. Medication reminder check-in
  5. Data export / compliance screen
- [ ] Voice-over (Thai or English)
- [ ] Text overlays with key metrics

### **3.2 Demo Environment Setup**
- [ ] **File:** `IP_SALES_PACKAGE/DEMO_SETUP_GUIDE.md`
- [ ] Step-by-step:
  1. Clone repo
  2. Create Firebase demo project (or use emulator)
  3. Deploy functions
  4. Seed demo data
  5. Access dashboard at `http://localhost:5173`

### **3.3 Demo Data Script**
- [ ] **File:** `functions/scripts/seed-demo-buyers.js` (new)
- [ ] Creates:
  - 5 elderly users (with realistic names, conditions)
  - 5 caregivers (linked to elderly)
  - 10 sample alerts (various types)
  - Sample settings & preferences
- [ ] Command:
  ```bash
  FIRESTORE_EMULATOR_HOST=localhost:8080 node scripts/seed-demo-buyers.js
  ```

### **3.4 Walkthrough Script**
- [ ] **File:** `IP_SALES_PACKAGE/WALKTHROUGH_SCRIPT.md`
- [ ] Timing: 20 minutes
- [ ] Flow:
  - Intro (2 min): Problem + solution
  - Dashboard demo (5 min): Show key features
  - Technical deep-dive (8 min): Architecture, security
  - Q&A (5 min): Price, timeline, support

---

## ✅ PHASE 4: Legal Documents (Days 8–10)

### **4.1 IP Purchase Agreement Template**
- [ ] **File:** `IP_SALES_PACKAGE/IP_PURCHASE_AGREEMENT.docx` (template)
- [ ] Sections:
  - Definitions (Software, IP, Buyer, Seller)
  - Grant of rights (Buyer owns code + all IP)
  - Exclusions (LINE channel, Firebase project)
  - Warranty (works as documented, 90-day support)
  - Liability (AS-IS, limited indemnity)
  - Support (if included: SLA, response time, term)
  - Confidentiality & NDA
  - Non-compete (optional: 2–3 years)
  - Payment (50% upfront, 50% on delivery, or milestone-based)
  - Signatures + date

### **4.2 Statement of Work (SOW) Template**
- [ ] **File:** `IP_SALES_PACKAGE/SOW_TEMPLATE.docx`
- [ ] For Package B/C (with support):
  - Scope of work (deployment, training, bug fixes)
  - Timeline (2-week deployment + 6-month support)
  - Deliverables checklist
  - Acceptance criteria
  - Change order process

### **4.3 Confidentiality / NDA**
- [ ] **File:** `IP_SALES_PACKAGE/NDA_TEMPLATE.docx`
- [ ] For pre-sale discussions
- [ ] Protects your demo, metrics, architecture

### **4.4 Support SLA Document**
- [ ] **File:** `IP_SALES_PACKAGE/SUPPORT_SLA.md`
- [ ] Example:
  ```
  Critical bugs: 4-hour response, 24-hour resolution
  High priority: 24-hour response, 7-day resolution
  Medium: 48-hour response, 14-day resolution
  Low: Best effort, 30 days
  ```

---

## ✅ PHASE 5: Handoff Documentation (Days 11–12)

### **5.1 Buyer Onboarding Guide**
- [ ] **File:** `IP_SALES_PACKAGE/BUYER_ONBOARDING.md`
- [ ] Week 1: Access code, review architecture, ask questions
- [ ] Week 2: Deploy to own Firebase, test deployment
- [ ] Week 3: Customize branding (logo, colors, messages)
- [ ] Week 4: Go live, monitor for issues

### **5.2 Source Code Walkthrough**
- [ ] **File:** `IP_SALES_PACKAGE/CODE_WALKTHROUGH.md`
- [ ] Directory structure explained
- [ ] Key files + their responsibilities
- [ ] Dependency overview
- [ ] Configuration guide (env vars, Firebase setup)

### **5.3 Customization Guide**
- [ ] **File:** `IP_SALES_PACKAGE/CUSTOMIZATION_GUIDE.md`
- [ ] How to:
  - Change branding (logo, colors, company name)
  - Modify alert thresholds
  - Add custom message templates
  - Integrate with their HIS/EMR system
  - White-label LINE bot

### **5.4 Deployment Handoff Checklist**
- [ ] **File:** `IP_SALES_PACKAGE/DEPLOYMENT_CHECKLIST.md`
- [ ] Pre-deployment verification (buyer confirms):
  - [ ] Firebase project set up (billing enabled)
  - [ ] LINE channel created (credentials ready)
  - [ ] Team trained (2–3 engineers)
  - [ ] Development environment tested
- [ ] Post-deployment (seller verifies):
  - [ ] Functions deployed
  - [ ] Firestore rules in place
  - [ ] PITR enabled
  - [ ] Monitoring alerts configured
  - [ ] 24-hour smoke test passed

---

## ✅ PHASE 6: Marketing Materials (Days 13–14)

### **6.1 One-Slide Pitch Deck**
- [ ] **File:** `IP_SALES_PACKAGE/PITCH_DECK_SINGLE.pptx`
- [ ] Slide 1: Problem + Solution (headline)
- [ ] Slide 2: Features + Verification (credibility)
- [ ] Slide 3: Market opportunity (TAM)
- [ ] Slide 4: Price + Package options
- [ ] Slide 5: Contact + CTA

### **6.2 Full Pitch Deck (20 slides)**
- [ ] **File:** `IP_SALES_PACKAGE/PITCH_DECK_FULL.pptx`
- [ ] Slide by slide:
  1. Title slide (problem: elderly care crisis)
  2. Thailand market (14M elderly, 2% digital)
  3. Competitor analysis (what's missing)
  4. NaMo Care solution
  5. Features overview (dashboard, LINE, alerts)
  6. Verification results (26/26 emulator scenarios)
  7. Architecture (simplified diagram)
  8. Security & compliance (PDPA checkboxes)
  9. Deployment timeline (2 weeks)
  10. ROI calculator (3,000 elderly × ฿2K = ฿72M/year)
  11. Pricing tiers (Packages A/B/C)
  12. Case study (pilot results, if any)
  13. Support & handoff
  14. Team (your background)
  15. Roadmap (future features)
  16. Risk mitigation (why this works)
  17. Social impact (elderly lives improved)
  18. Competition (why now, why you)
  19. Call to action
  20. Contact + next steps

### **6.3 Email Templates**
- [ ] **File:** `IP_SALES_PACKAGE/EMAIL_TEMPLATES.md`
- [ ] Template 1: Cold outreach (MedThai, Doctorlink)
- [ ] Template 2: Warm introduction (via LinkedIn)
- [ ] Template 3: Follow-up (after no response)
- [ ] Template 4: Demo offer
- [ ] Template 5: Negotiation (price discussion)
- [ ] Template 6: Closing (contract ready)

### **6.4 LinkedIn Posts**
- [ ] **File:** `IP_SALES_PACKAGE/SOCIAL_MEDIA.md`
- [ ] Post 1: "Built an elderly care platform verified in emulator"
- [ ] Post 2: "26 scenarios, 0 false negatives — medical-grade ready"
- [ ] Post 3: "Seeking acquisition partner for Southeast Asia scale"

---

## ✅ PHASE 7: Contact List & CRM (Day 15)

### **7.1 Target Buyer Database**
- [ ] **File:** `IP_SALES_PACKAGE/BUYER_DATABASE.csv`
- [ ] Columns:
  ```
  Company, Contact Name, Title, Email, Phone, LinkedIn URL,
  Interest Level (1-5), Priority (Tier 1-5), 
  Est. Price Range, Timeline, Notes
  ```
- [ ] Rows: All 15 target companies + contact info

### **7.2 Outreach Tracker**
- [ ] **File:** `IP_SALES_PACKAGE/OUTREACH_TRACKER.md`
- [ ] Table tracking:
  - Date contacted
  - Response received (Y/N)
  - Demo scheduled (Y/N)
  - Serious interest (Y/N)
  - Negotiation stage
  - Expected close date

---

## ✅ PHASE 8: Final Package Assembly (Day 16)

### **8.1 Create Google Drive Folder**
```
NaMo Care IP Sales Package/
├── 01_ONE_PAGER.md
├── 02_EXECUTIVE_SUMMARY.pdf
├── 03_TECHNICAL_SPEC.md
├── 04_SECURITY_COMPLIANCE.md
├── 05_SYSTEM_REQUIREMENTS.md
├── 06_PRICING_LICENSE.md
├── DEMO_SETUP_GUIDE.md
├── WALKTHROUGH_SCRIPT.md
├── IP_PURCHASE_AGREEMENT.docx
├── SOW_TEMPLATE.docx
├── NDA_TEMPLATE.docx
├── SUPPORT_SLA.md
├── BUYER_ONBOARDING.md
├── CODE_WALKTHROUGH.md
├── CUSTOMIZATION_GUIDE.md
├── DEPLOYMENT_CHECKLIST.md
├── PITCH_DECK_SINGLE.pptx
├── PITCH_DECK_FULL.pptx
├── EMAIL_TEMPLATES.md
├── SOCIAL_MEDIA.md
├── BUYER_DATABASE.csv
├── OUTREACH_TRACKER.md
└── namo-care-ip-complete.tar.gz
```

### **8.2 Create README for Package**
- [ ] **File:** `IP_SALES_PACKAGE/README.md`
- [ ] Guide: "How to use this sales package"
- [ ] "Start with 01_ONE_PAGER.md"
- [ ] "Send 02_EXECUTIVE_SUMMARY.pdf to prospects"
- [ ] "Use PITCH_DECK_FULL.pptx for meetings"

### **8.3 Prepare Download Link**
- [ ] Google Drive: Share link (read-only for prospects)
- [ ] Alternative: Dropbox, WeTransfer, or GitHub private repo

---

## ✅ PHASE 9: Launch Checklist (Day 17–20)

### **9.1 Pre-Launch Verification**
- [ ] All documents spell-checked
- [ ] All numbers verified (14M elderly, 26 scenarios, etc.)
- [ ] All links work (demo video plays, GitHub links live)
- [ ] All contact emails accurate
- [ ] All prices consistent ($1.5M–$3M range)

### **9.2 LinkedIn Optimization**
- [ ] Update profile headline: "NaMo Care Founder — Medical-Grade Elderly Care Tech"
- [ ] Update about section: Include pitch + link to one-pager
- [ ] Add demo video to media
- [ ] Follow all 15 target companies

### **9.3 Email List Ready**
- [ ] Gmail organized into folders
- [ ] Contact info verified (no typos)
- [ ] Email templates tested (send to self first)
- [ ] Scheduled first batch of 5 emails

### **9.4 Calendar Blocked**
- [ ] Week 1: Send 5 outreach emails
- [ ] Week 2: Follow-ups + demo calls
- [ ] Week 3–4: Negotiations
- [ ] Week 5–8: Due diligence + legal
- [ ] Week 9–10: Close + handoff

---

## ✅ PHASE 10: Continuous Improvement

### **10.1 Tracking Metrics**
- [ ] Email open rate target: 25%+
- [ ] Demo request rate: 10%+ of emails sent
- [ ] Serious interest (due diligence): 3+ companies
- [ ] Target close: 4–8 weeks

### **10.2 Feedback Loop**
- [ ] Prospect feedback: Document objections + pricing concerns
- [ ] Update deck/documents based on feedback
- [ ] Weekly check-in: Review outreach tracker, adjust strategy

### **10.3 Contingency**
- [ ] If no traction in 4 weeks: Switch to warm intros (via mutual contacts)
- [ ] If no traction in 8 weeks: Consider VC fundraising instead (Option 2)

---

## 🎯 SUMMARY — Ready When Complete

✅ **Documents:** 20+ sales + legal templates  
✅ **Demo:** Video + live environment setup guide  
✅ **Pitch:** Single-slide + full deck  
✅ **Contacts:** 15 target buyers with emails  
✅ **Timeline:** 4–5 months to close  
✅ **Price:** $1.5M–$3M  

**Start sending emails: Week 1 (2026-07-20)**
