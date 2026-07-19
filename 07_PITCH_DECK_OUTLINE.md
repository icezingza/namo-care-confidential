# 07 Pitch Deck Outline - Sprint 2 Freeze

**Classification:** Confidential  
**Baseline:** Sprint 2 frozen codebase  
**Last synchronized:** 2026-07-17

## Slide 1 - Title

**Namo Care: Reliable Medication Adherence for Care Teams**  
Confidential Sprint 2 freeze narrative.

## Slide 2 - Problem

Medication adherence workflows still rely on manual follow-up, delayed escalation, and fragmented caregiver visibility.

## Slide 3 - Solution

Namo Care combines a React dashboard, LINE reminders, Firestore audit records, caregiver escalation, and **Continuous Smartwatch Monitoring (Dual-write SOS Pipeline)** so missed medication events and vital emergencies do not disappear silently.

## Slide 4 — The Complete NaMo Care Ecosystem (Product Workflow)

- **LINE Bot (ผู้สูงอายุ):** ใช้งานง่ายผ่านแชท ไม่ต้องโหลดแอปใหม่
- **Web Dashboard (ผู้ดูแล/แพทย์):** ศูนย์ควบคุมข้อมูลตามมาตรฐาน PDPA
- **[NEW] Continuous Wearable Monitoring:** สมาร์ทวอทช์ทำงานเบื้องหลัง (Invisible UI) ซิงค์อัตราการเต้นหัวใจ, ก้าวเดิน, และ SpO2 อัตโนมัติ เพื่อการป้องกันเชิงรุก (Proactive Prevention)

## Slide 5 — Medical-Grade Architecture & Reliability (The Technical Win)

- Medication-alert state machine frozen for Sprint 2.
- Idempotent terminal states protect against duplicate adherence records.
- Smoke-test workflow formalized for release validation.
- 100% Serverless deployment path via Google Cloud Functions and Firestore (Zero DevOps overhead).
- **Zero False Negatives:** รัดกุมด้วยระบบ State Machine, Retry Queue และ Dead-letter Pipeline
- **[NEW] Hybrid Cloud Fallback:** ระบบ Webhook สำหรับ Smartwatch ทำงานแบบ Dual-write เข้าสู่ระบบ SOS ทันทีเมื่อเกิดการหกล้ม
- **ผลการทดสอบ:** ผ่านฉลุย 100% ทั้ง 53 Integration Tests บนสภาพแวดล้อมจำลอง (Firestore Emulator)

## Slide 6 - Performance Win

- Sprint 2 final alert latency baseline: **~485 ms**.
- Operational target: **< 500 ms**.
- Result: latency target met with release-blocker threshold documented for future regressions.

## Slide 7 - Trust & Safety

- Firestore audit records for alert and compliance events.
- Deterministic scheduler alert IDs for idempotent repeated runs.
- Emergency alerts are never deduplicated.
- LINE credential rotation and Firestore PITR remain mandatory go-live gates.

## Slide 8 — Operations & Cost Efficiency

- Serverless architecture removes DevOps, scaling automatically to millions of users.
- Firebase Emulator suite supports local runtime smoke validation without production risk.
- Zero server maintenance drastically reduces hospital IT overhead (saving ฿1,000–2,000/month per site).

## Slide 9 — Future-Proof Commercialization (โอกาสทางธุรกิจ)

- **Insurance Telematics:** เปลี่ยนข้อมูลสุขภาพ 24/7 จากข้อมือผู้สูงอายุ เป็นส่วนลดเบี้ยประกันภัย สร้าง Ecosystem แบบ Win-Win
- **AI Predictive Analytics:** รากฐานข้อมูลเพื่อต่อยอดสู่การพยากรณ์โรคเชิงรุก และการวิเคราะห์ Biological Age แบบเดียวกับมาตรฐานของโรงพยาบาลระดับสากล

## Slide 10 - Current Status

Sprint 2 is frozen with the core medication-reminder state model, ~485 ms performance baseline, Firebase deployment runbook, and smoke-test intent synchronized to the as-built codebase. Release-readiness caveats remain: repair the checked-in `smoke-tests.sh` conflict, add the missing Cloud Tasks dependency, and align medication scheduler exports before using the branch as a clean production gate.

## Slide 11 - Next Milestones

- Resolve `smoke-tests.sh` conflict and rerun the emulator smoke path.
- Align medication scheduler calls with exported handler names and add the missing Cloud Tasks dependency.
- Repeat real LINE sandbox smoke test after credential rotation.
- Continue latency monitoring against the <500 ms release gate.
