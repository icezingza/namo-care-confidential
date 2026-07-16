# NaMo Care IP — Market Launch Action Plan

**For:** Immediate execution after security audit completion  
**Timeline:** Week 1—4 (first month of market outreach)  
**Contact:** contact@namonexus.com  
**Status:** Ready to launch

---

## 🎯 ONE-WEEK SPRINT (Days 1–7)

### Day 1: Research & Personalization (3 hours)

**Task 1.1: Gather Contact Information**
- [ ] LinkedIn: Search for 15 target company decision-makers (CEO, CTO, VP Healthcare)
- [ ] Record: Name, title, email, LinkedIn profile URL, company phone
- [ ] Use Google Sheets template:
  ```
  Company | Contact Name | Title | Email | LinkedIn | Tier | Email Template | Status
  ```
- Time: 2 hours

**Task 1.2: Verify Contact Details in Sales Materials** ✅ DONE
- [x] Contact channels: Email (contact@namonexus.com) + LinkedIn + GitHub — **text-based only, by design**
- [x] All documents personalized (Kanin Raksaraj, NamoNexus branding)
- Note: การสื่อสารทั้งหมดเป็น async (อีเมล/ข้อความ) — ดู "Async-First Communication Strategy" ด้านล่าง
- Time: 0 hours (complete)

**Expected output:** Contact list spreadsheet + updated sales materials ready to send

---

### Day 2: Email Campaign Setup (2 hours)

**Task 2.1: Email Tracking Setup**
- [ ] Choose email tracking tool (recommendations):
  - Free: Gmail + Google Sheets (manual tracking)
  - Paid: Streak ($99/month), HubSpot ($50/month), Mailchimp (free for <500 contacts)
- [ ] Set up tracking for open rates + click rates on email links
- [ ] Create tracking template: Subject line variations (A/B test)
- Time: 1 hour

**Task 2.2: Email Template Preparation**
- [ ] Copy 6 email templates from 05_OUTREACH_EMAIL_TEMPLATES.md
- [ ] Create Word doc / Google Docs with all templates
- [ ] Personalize subject lines for each recipient
- [ ] Save draft emails (don't send yet; review Day 3)
- Time: 1 hour

**Expected output:** Email tracking spreadsheet + draft email library

---

### Day 3: Pitch Deck Creation (4 hours)

**Task 3.1: Google Slides/PowerPoint Setup**
- [ ] Create new Google Slides presentation (or use PowerPoint)
- [ ] Use 07_PITCH_DECK_OUTLINE.md as content framework
- [ ] Create 18 slides following outline structure
- [ ] Add company branding (if you have logo) or use simple NaMo Care colors
- Time: 3 hours

**Task 3.2: Supporting Visuals**
- [ ] Slide 5: Add architecture diagram (ASCII or simple box diagram)
- [ ] Slide 8: Add revenue chart (5-year projection)
- [ ] Slide 10: Add timeline/Gantt chart
- [ ] Slide 16: Add pie chart (fund allocation)
- Time: 1 hour

**Expected output:** Full pitch deck ready for presentations

---

### Day 4: Demo Preparation (3 hours)

**Task 4.1: Firebase Emulator Setup (if showing live demo)**
- [ ] Ensure Firebase emulator is running locally: `firebase emulators:start --only functions,firestore`
- [ ] Seed demo data: `cd functions && npm run seed:demo`
- [ ] Test all demo flows:
  - [ ] Elderly sends medication confirmation on LINE
  - [ ] Caregiver sees alert on dashboard
  - [ ] SOS emergency flow works end-to-end
  - [ ] Export compliance data works
- Time: 2 hours

**Task 4.2: Demo Script**
- [ ] Write 5-minute demo script covering:
  1. Dashboard overview (elderly monitoring, alerts, settings)
  2. LINE Bot interaction (medication reminder → response)
  3. Emergency flow (SOS alert, caregiver notification)
  4. Compliance features (data export, deletion)
- [ ] Practice delivery (time yourself; aim for <5 minutes)
- Time: 1 hour

**Expected output:** Live demo ready + demo script

---

### Day 5: Sales Materials Review (2 hours)

**Task 5.1: Quality Check**
- [ ] Review all sales documents for typos, consistency, accuracy
  - [ ] 01_ONE_PAGER.md
  - [ ] 02_EXECUTIVE_SUMMARY.md
  - [ ] 03_TECHNICAL_SPEC.md
  - [ ] 04_SECURITY_COMPLIANCE.md
- [ ] Verify all contact info is consistent across documents
- [ ] Check formatting (headings, lists, spacing)
- Time: 1 hour

**Task 5.2: PDF Export**
- [ ] Export key documents as PDFs (for email attachments):
  - [ ] 01_ONE_PAGER.pdf (send in first email)
  - [ ] 02_EXECUTIVE_SUMMARY.pdf (send after meeting)
  - [ ] 04_SECURITY_COMPLIANCE.pdf (for security-conscious buyers)
- Time: 0.5 hour

**Expected output:** Polish + PDF versions of sales materials

---

### Day 6: First Email Batch (2 hours)

**Task 6.1: Send to Tier 1 (Highest Priority)**
- [ ] Send personalized emails to 3 Tier 1 targets:
  1. LINE Thailand (CEO or VP Healthcare Solutions)
  2. True Corp (Chief Digital Officer)
  3. MedThai (CEO)
- [ ] Use Email 1 (cold outreach) or Email 2 (warm intro if you have mutual connection)
- [ ] Include: subject line, body, attachment (01_ONE_PAGER.pdf)
- [ ] Attach meeting calendar link (Calendly or Google Calendar) for scheduling
- Time: 1 hour

**Task 6.2: Tier 2 Parallel Track**
- [ ] Send emails to 2 Tier 2 targets (parallel to Tier 1):
  1. Doctorlink (CEO / VP Product)
  2. Bangkok Dusit (Chief Digital Officer)
- [ ] Use Email 2 (warm intro) if possible; Email 5 (white-label) if healthcare chain
- Time: 0.5 hour

**Task 6.3: Track Responses**
- [ ] Log in spreadsheet:
  - Sent timestamp
  - Email template used
  - Opening status (if tracking enabled)
  - Click-through rate (if tracking enabled)
- Time: 0.5 hour

**Expected output:** 5 personalized emails sent + tracking spreadsheet updated

---

### Day 7: Wait & Prepare Follow-Up (1 hour)

**Task 7.1: Prepare Follow-Up Email**
- [ ] Prepare Email 3 (follow-up) for Day 10 send (if no response)
- [ ] Keep template in "drafts" folder
- [ ] Customize for each recipient (don't send yet)
- Time: 0.5 hour

**Task 7.2: Prepare for Meetings**
- [ ] Print pitch deck (if printing for meetings)
- [ ] Prepare one-pager printouts
- [ ] Set up remote meeting links (Zoom, Google Meet, Teams)
- [ ] Test audio/video (if doing demo call)
- Time: 0.5 hour

**Expected output:** Follow-up emails ready + meeting logistics prepared

---

## 🎯 WEEK 2 (Days 8–14)

### Days 8–10: Inbound Responses & Meeting Scheduling

**Expected outcomes from Week 1 emails:**
- 5 emails sent to Tier 1 + Tier 2
- Open rate target: 20–30% (1–1.5 opens)
- Reply rate target: 5–10% (0.25–0.5 replies)
- Meetings scheduled: 1–2 demos

**Actions if meetings scheduled:**
- [ ] Send calendar invite + meeting link
- [ ] Send agenda email (what you'll cover + duration)
- [ ] Prepare demo (refresh emulator, test flows)
- [ ] Review prospect company background (news, recent press releases)

**Actions if no responses:**
- [ ] Send Email 3 (follow-up) on Day 10 to non-openers
- [ ] Alternative: LinkedIn message (more personal touch than email)

---

### Days 11–14: Second Batch + Tier 3 Outreach

**Task 11.1: Send Tier 2 Batch 2**
- [ ] Send to next 3 Tier 2 companies:
  1. Bumrungrad (VP Innovation)
  2. Thaihealth (Director Digital Health)
  3. Acumen Medical (CEO)
- [ ] Use Email 2 (warm) or Email 5 (white-label for healthcare chains)
- Time: 1 hour

**Task 11.2: Send Tier 3 Batch 1**
- [ ] Send to 3 Tier 3 targets:
  1. Senior Living Chains (operations manager)
  2. IT Consulting Firms (healthcare practice lead)
  3. Insurance Companies (Chief Innovation Officer)
- [ ] Use Email 5 (white-label/distribution) or Email 6 (integration)
- Time: 1 hour

**Task 11.3: First Evaluation Package Sent (when a prospect replies)**
- [ ] Send: recorded demo video + technical spec + security audit + `11_BUYER_FAQ.md`
- [ ] Answer follow-up questions in writing within 24 hours (copy from FAQ where possible; add new answers to FAQ)
- [ ] Send next-step email: "Here's the NDA + data room access for deeper review"
- Time: 1 hour

---

## 🎯 WEEK 3–4 (Days 15–28)

### Ongoing Metrics & Adjustments

**Daily:**
- [ ] Check email open/click rates (tracking tool)
- [ ] Monitor LinkedIn messages (alternative contact channel)
- [ ] Log new replies/inquiries in spreadsheet

**Every 3 days:**
- [ ] Send follow-up to non-openers (Email 3)
- [ ] Reach out via LinkedIn if email unreplied for 5 days

**Weekly:**
- [ ] Sales report: Opens, clicks, replies, meetings scheduled
- [ ] Adjust email template if open rates below 20% (try different subject lines)
- [ ] Demo feedback: Did prospects ask questions about security/pricing/timeline?
- [ ] Adjust pitch deck based on feedback (e.g., if lots of pricing questions, add more financial detail)

### Expected Outcomes (Goal: 4 weeks)

| Metric | Target | Actual |
|---|---|---|
| Emails sent (Tier 1–3) | 15 | ___ |
| Open rate | 25% | ___ |
| Reply rate | 5–10% | ___ |
| Meetings scheduled | 3–5 | ___ |
| Demos completed | 1–2 | ___ |
| LOI (Letter of Intent) received | 1 | ___ |
| Close timeline (first deal) | 2–4 weeks after LOI | ___ |

---

## 📋 SUPPORTING DOCUMENTS CHECKLIST

Before launching, verify you have:

- [ ] **01_ONE_PAGER.md** (ready to send in first email)
- [ ] **02_EXECUTIVE_SUMMARY.md** (detailed overview for serious prospects)
- [ ] **03_TECHNICAL_SPEC.md** (for technical due diligence)
- [ ] **04_SECURITY_COMPLIANCE.md** (for security-conscious buyers)
- [ ] **05_OUTREACH_EMAIL_TEMPLATES.md** (6 templates for different scenarios)
- [ ] **06_TARGET_BUYER_DATABASE.md** (15 companies with contact info)
- [ ] **07_PITCH_DECK_OUTLINE.md** (18-slide presentation framework)
- [ ] **SECURITY_AUDIT_REPORT.md** (proof of no vulnerabilities)
- [ ] **Pitch Deck Google Slides** (created from outline)
- [ ] **Demo Emulator Setup** (verified working locally)
- [ ] **Email Tracking Spreadsheet** (for metrics)
- [ ] **Contact List CSV** (names, emails, company)

---

## 💡 COMMUNICATION TIPS

**Email best practices:**
- Subject line: Specific + compelling (not generic "Elderly Care Platform")
- Body: Short (max 150 words), benefit-first (save 6 months of dev, recurring revenue)
- CTA: Clear (demo call, 30 min, this week?) + calendar link
- Attach: 1-pager PDF only (not all sales docs; that's overwhelming)
- Follow-up: If no open in 3 days, resend with different subject line

**🔑 Async-First Communication Strategy (ยุทธศาสตร์หลัก — ไม่ต้องโทร ไม่ต้องประชุม):**

ทุกการสื่อสารเป็น**เอกสารและข้อความเท่านั้น** — จุดแข็ง ไม่ใช่จุดอ่อน:

- **Demo video แทน demo call** — อัดวิดีโอ 3–5 นาที (dashboard + LINE Bot + emergency flow) ครั้งเดียว ใช้ได้กับผู้ซื้อทุกราย ไม่ต้องเดโมสดซ้ำ ๆ
- **`11_BUYER_FAQ.md` แทนการตอบคำถามสด** — ผู้ซื้อถามอะไรมา: (1) ถ้ามีใน FAQ → copy คำตอบส่ง (2) ถ้าไม่มี → เขียนตอบใหม่ + เพิ่มเข้า FAQ (คลังคำตอบโตขึ้นเรื่อย ๆ)
- **SLA ตอบภายใน 24 ชั่วโมง** — สัญญาไว้ในทุกอีเมล และรักษาให้ได้ นี่คือสิ่งที่สร้างความเชื่อมั่นแทนการคุย
- **จุดขายของ async:** คำตอบเป็นลายลักษณ์อักษร = อ้างอิงได้ = ผูกพันได้ในสัญญา — ผู้ซื้อระดับ enterprise ชอบสิ่งนี้
- **ถ้าผู้ซื้อยืนยันขอประชุมสด:** (1) เสนอ chat ผ่าน LINE/email แบบ real-time แทน (2) สำหรับขั้นตอนท้าย ๆ พิจารณาจ้างตัวแทน/broker/ที่ปรึกษากฎหมายเข้าประชุมแทน (ค่า commission 3–5% คุ้มถ้าดีลระดับ $1M+)

**LinkedIn tips:**
- Personalized connection request (mention their recent post or company news)
- Message: Short, specific, not salesy ("Noticed you're leading digital transformation at [Company]; thought you'd find this elderly care platform interesting")
- Link to 1-pager or pitch deck
- Aim for: email thread with the decision-maker (keep everything in writing)

---

## 🚀 QUICK LAUNCH CHECKLIST

**Before Day 1:**
- [ ] Contact info updated in sales materials (phone, LinkedIn)
- [ ] Email templates ready (in Word doc or email client drafts)
- [ ] Pitch deck created (18 slides)
- [ ] Demo emulator tested (flows work end-to-end)
- [ ] Email tracking set up (Streak, HubSpot, or manual)
- [ ] Contact list spreadsheet created (15 companies)

**Day 1–7:**
- [ ] Gather 15 target contact emails (LinkedIn + company research)
- [ ] Send 5 personalized emails (Tier 1 + 2)
- [ ] Track opens/clicks
- [ ] Prepare follow-ups

**Day 8–14:**
- [ ] Send follow-up emails (Email 3 to non-openers)
- [ ] Conduct 1–2 demo calls (if meetings scheduled)
- [ ] Send next batch of emails (Tier 3)
- [ ] Collect feedback on pitch

**Day 15–28:**
- [ ] Continue follow-ups and outreach
- [ ] Target: 3–5 demo meetings, 1 LOI received
- [ ] Adjust messaging based on feedback

---

## 📞 SUCCESS MILESTONES

**Week 1:** ✅ Launch complete (5 emails sent)  
**Week 2:** ✅ First meeting/demo scheduled  
**Week 3:** ✅ Second demo completed + feedback collected  
**Week 4:** ✅ First LOI or serious interest from buyer  

**Exit Target:** First paid customer/partner by end of August 2026 (6 weeks from launch)

---

## 🎯 NEXT IMMEDIATE ACTION

**👉 START HERE (Today, 1 hour):**

1. Open `06_TARGET_BUYER_DATABASE.md`
2. Pick 3 Tier 1 companies (LINE Thailand, True Corp, MedThai)
3. Search LinkedIn for decision-maker contact info
4. Update spreadsheet:
   ```
   Company | Contact Name | Title | Email | LinkedIn URL
   LINE Thailand | [Name] | [Title] | [Email] | [LinkedIn]
   ```
5. Update phone + LinkedIn in sales materials
6. Send first email to Tier 1 target by end of Day 1

**That's it.** Once you send the first email, the rest of the process follows naturally.

---

**Status:** 🚀 READY TO LAUNCH  
**Timeline:** Start immediately; first customer expected in 4–6 weeks  
**Contact:** contact@namonexus.com  
**Questions?** Review sales docs or schedule a prep call to finalize messaging  

**Let's get NaMo Care to the market. ด้วยความเมตตาครับ 🙏**

---

**Prepared:** July 2026  
**Version:** Launch Ready  
**Last Updated:** [Today's date]
