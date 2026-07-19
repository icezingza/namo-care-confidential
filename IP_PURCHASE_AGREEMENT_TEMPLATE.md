# IP PURCHASE AGREEMENT (TEMPLATE)

**Software:** NaMo Care Platform (elderly care + LINE Bot)  
**Seller:** Kanin Raksaraj / NamoNexus  
**Buyer:** [BUYER COMPANY NAME]  
**Date of Agreement:** [DATE]  
**Confidentiality:** This agreement is confidential and binding  

---

## 1. DEFINITIONS

**"Software"** means the NaMo Care source code, documentation, deployment scripts, and all materials delivered under this agreement.

**"IP"** (Intellectual Property) means all copyrights, patents, trade secrets, and proprietary rights in the Software.

**"Buyer"** means [Company Name], a [country] corporation.

**"Seller"** means Kanin Raksaraj, operating as NamoNexus.

**"Deliverables"** means the items listed in Section 2 (Grant of Rights).

**"Effective Date"** means the date both parties sign this agreement.

---

## 2. GRANT OF RIGHTS

**2.1 Ownership Transfer**  
Seller hereby grants Buyer **full, exclusive, irrevocable ownership** of the Software, all source code, documentation, and all derivatives. This includes:

- All copyright interests in the code
- All patent rights (if any) to the architecture
- All trade secrets and proprietary methods
- All related documentation, comments, and technical guides

**2.2 Rights Granted**  
Buyer may, without further permission from Seller:

- Modify the Software for any purpose
- Create derivative works
- Incorporate the Software into Buyer's products
- White-label or rebrand the Software
- Commercialize, distribute, and license the Software to third parties
- Sublicense the Software to partners or customers

**2.3 Exclusions**  
Buyer is responsible for creating and maintaining:

- Firebase project (Buyer creates own Google Cloud project)
- LINE Official Account and channel credentials
- Hosting environment and deployment infrastructure

Seller does NOT transfer Firebase credentials, LINE channel access, or any third-party accounts.

---

## 3. INTELLECTUAL PROPERTY REPRESENTATIONS

**3.1 Ownership Warranty**  
Seller warrants that:
- Seller owns or controls all IP in the Software
- The Software does not infringe any third-party IP rights (to Seller's knowledge)
- Seller has the right to grant the rights herein

**3.2 Reservation of Rights**  
Seller retains the right to:
- Use the NaMo Care architecture for other geographic markets (outside Buyer's deployment region)
- Use the architecture for other vertical markets (e.g., education, R&D)
- Reference the Software as a portfolio/case study (without revealing Buyer's confidential data)

---

## 4. WARRANTIES & DISCLAIMERS

**4.1 Limited Warranty**  
Seller warrants that the Software:
- Will function substantially as described in the Technical Specification
- Complies with the Security & Compliance Report (verified in Firestore Emulator)
- Will be delivered with complete, buildable source code

**Warranty Period:** 90 days from delivery.

**4.2 Disclaimer of Other Warranties**  
EXCEPT AS EXPRESSLY STATED, SELLER PROVIDES THE SOFTWARE "AS-IS" WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING:
- MERCHANTABILITY
- FITNESS FOR A PARTICULAR PURPOSE
- NON-INFRINGEMENT

**4.3 Production Disclaimer**  
All verification was performed on Firestore Emulator using real SDK semantics. Production performance depends on:
- Proper deployment and configuration
- Network stability and bandwidth
- LINE API availability
- Firebase quota management
- Adherence to deployment runbook

Seller does NOT guarantee specific performance, uptime, or SLA for production deployments.

**4.4 Demarcation Points (SLA Boundaries)**  
To prevent false Service Level Agreement (SLA) breach claims, the following demarcation points are established:
- **Firebase Quotas & Limits:** Any downtime, latency, or failure caused by Firebase/GCP quota exhaustion, rate limiting, or platform-wide outages is explicitly excluded from Seller's SLA obligations.
- **LINE API Quotas & Limits:** Any failure to deliver notifications, alerts, or messages due to LINE Messaging API quota limits, account bans, or LINE server outages is strictly the responsibility of the Buyer and excluded from Seller's SLA.
---

## 5. LIMITATION OF LIABILITY

**5.1 Limitation**  
EXCEPT FOR BREACHES OF CONFIDENTIALITY, NEITHER PARTY SHALL BE LIABLE TO THE OTHER FOR:
- Indirect, incidental, or consequential damages (lost profits, lost data, etc.)
- Damages exceeding the total purchase price paid under this agreement

**5.2 Buyer Responsibility**  
Buyer assumes all responsibility for:
- Security of Buyer's Firebase project and LINE channel
- Data protection and PDPA compliance in production
- Breach notification procedures to Thai PDPC
- User consent and data handling policies

---

## 6. SUPPORT & SERVICE LEVELS

**6.1 Package A (Source Code Only)**  
- 1 week of post-delivery email support (questions about deployment)
- No SLA guarantees

**6.2 Package B (Code + 6-Month Support)**  
- 6 months of email-based technical support
- Bug fix response: 4 hours for critical issues (business hours, Thailand timezone)
- "Critical" = security breach, infrastructure down, webhook non-functional
- Best-effort support for other issues

**6.3 Package C (Full Transition)**  
- 12 months of technical support with SLA
- 4-hour response for critical issues
- White-label customization included
- Data migration support
- Full ops team training (10–15 people)

---

## 7. CONFIDENTIALITY

**7.1 Confidential Information**  
The terms and conditions of this agreement, pricing, and pre-delivery technical details are confidential. Each party agrees to:
- Keep this agreement confidential
- Not disclose terms to competitors
- Not publicly reference pricing or deal structure

**7.2 Permitted Disclosures**  
Either party may disclose this agreement:
- To legal counsel and accountants (under NDA)
- As required by law or court order
- To comply with regulatory requirements

**7.3 Public Announcement**  
Neither party shall issue a press release or public announcement without the other party's prior written consent.

---

## 8. DATA PROTECTION (PDPA)

**8.1 Data Controller / Processor**  
Upon delivery, Buyer becomes the Data Controller for all elderly users' data. Seller (if providing support) acts as a Data Processor.

**8.2 PDPA Compliance**  
Buyer assumes responsibility for:
- Obtaining user consent for data collection
- Implementing breach notification procedures (72-hour notification to Thai PDPC)
- Maintaining data retention policies (90-day alert logs, 180-day conversations)
- Enabling Point-in-Time Recovery (PITR) for disaster recovery
- User right-to-access and right-to-deletion compliance

**8.3 Data Breach**  
If a breach occurs:
1. Buyer notifies Thai PDPC within 72 hours (if high-sensitivity data exposed)
2. Buyer notifies affected users within 30 days
3. If Seller is supporting, Seller assists with investigation (at Buyer's cost if out-of-scope)

---

## 9. PAYMENT TERMS

**Payment Structure:** [Choose one]

### Option A: Upfront + Delivery
- 50% upon signing this agreement
- 50% upon successful delivery and acceptance testing

### Option B: Milestone-Based
- 33% upon signing
- 33% upon deployment to Buyer's Firebase
- 34% upon go-live and user acceptance

### Option C: Escrow (Package C only)
- 50% to escrow agent at signing
- 50% held until source code escrow is established
- Released upon Buyer's confirmation of delivery

**Payment Details:**
- Currency: USD (or THB at agreed exchange rate)
- Due Date: [NET 30 / NET 15 / Upon Invoice]
- Late Fees: 1.5% per month if overdue

---

## 10. ACCEPTANCE & TESTING

**10.1 Acceptance Period**  
Buyer has **14 days** from delivery to:
- Verify source code completeness
- Test deployment to own Firebase project
- Confirm architecture documentation accuracy

**10.2 Acceptance Criteria**  
Software is accepted if:
- Source code compiles without errors
- Deployment scripts execute successfully
- Firestore rules deploy without errors
- Architecture documentation is complete and accurate

**10.3 Rejection**  
If Software fails acceptance criteria, Buyer must notify Seller within 14 days with specific defects. Seller has 7 days to fix defects at no additional cost.

---

## 11. SOURCE CODE ESCROW (Package C only)

**11.1 Escrow Agent**  
Seller will engage a third-party escrow service ([Escrow.com / Iron Mountain / other]) to hold:
- Complete, compilable source code
- Build scripts and dependencies
- Documentation and architecture guide

**11.2 Escrow Trigger**  
Code is released to Buyer within **48 hours** if:
- Seller becomes insolvent or bankrupt
- Seller ceases to provide support or responds to a critical infrastructure failure within 48 hours of Buyer's emergency request
- Seller is subject to regulatory action affecting operations

**11.3 Escrow Term**  
Escrow period covers the 12-month support term + 2 years after support ends.

**11.4 Costs**  
Escrow setup and annual maintenance fees are [included in Package C / paid 50/50 / Buyer responsibility].

---

## 12. TERM & TERMINATION

**12.1 Term**  
- This agreement is effective upon signing and is perpetual for IP ownership rights
- Support services (if applicable) are provided for [6 months / 12 months]

**12.2 Termination for Cause**  
Either party may terminate if:
- The other party materially breaches this agreement and fails to cure within 30 days
- Insolvency proceedings are initiated against the other party

**12.3 Effect of Termination**  
- IP ownership rights survive termination and remain with Buyer
- Support obligations end upon termination
- Confidentiality obligations survive termination indefinitely

---

## 13. GENERAL PROVISIONS

**13.1 Governing Law**  
This agreement is governed by the laws of [Thailand / Delaware / Singapore], without regard to conflict of law principles.

**13.2 Dispute Resolution**  
Any disputes shall be resolved through:
1. Good-faith negotiation (14 days)
2. Mediation (if negotiation fails)
3. Arbitration or litigation (in [specified jurisdiction])

**13.3 Entire Agreement**  
This agreement constitutes the entire agreement between the parties and supersedes all prior negotiations, understandings, and agreements.

**13.4 Amendment**  
This agreement may only be amended in writing, signed by both parties.

**13.5 Severability**  
If any provision is found invalid, the remaining provisions continue in effect.

**13.6 Counterparts**  
This agreement may be executed in counterparts (email signatures acceptable).

---

## 14. SIGNATURES

**SELLER:**

___________________________  
Kanin Raksaraj  
NamoNexus  
Date: ___________________

**BUYER:**

___________________________  
[Authorized Representative Name]  
[Authorized Representative Title]  
[Buyer Company]  
Date: ___________________

---

## EXHIBITS

**Exhibit A:** Technical Specification  
**Exhibit B:** Security & Compliance Report  
**Exhibit C:** Deployment Guide  
**Exhibit D:** Firestore Schema Documentation  

---

**Document Status:** Template — Customize per deal structure  
**Last Updated:** July 2026
