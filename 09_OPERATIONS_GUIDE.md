# NaMo Care — Operations Guide

**For:** System Administrators, DevOps Teams, Hospital IT Staff  
**Date:** July 2026  
**Language:** Professional Thai + English technical terms  
**Confidentiality:** Internal Use Only

---

## 📋 Table of Contents

1. [การติดตั้งระบบ (Deployment)](#deployment)
2. [การตรวจสอบสุขภาพระบบ (System Health Monitoring)](#monitoring)
3. [การอ่าน Log เพื่อหาปัญหา (Log Analysis)](#logs)
4. [แก้ไขปัญหาเร่งด่วน (Troubleshooting)](#troubleshooting)
5. [วิธีจัดการฉุกเฉิน (Emergency Procedures)](#emergency)
6. [บำรุงรักษา (Maintenance)](#maintenance)

---

## Deployment

### ก่อนเริ่มติดตั้ง (Pre-Deployment Checklist)

ต้องเตรียมให้พร้อม 48 ชั่วโมงก่อนเริ่มติดตั้ง:

- [ ] **Firebase Project ใหม่**: สร้าง Firebase project ใน Google Cloud Console
  - ตั้งชื่อ: `namo-care-[hospital-name]` (เช่น `namo-care-bumrungrad`)
  - Region: `asia-southeast1` (Bangkok) สำหรับประสิทธิภาพที่ดี
  
- [ ] **LINE Channel**: สร้าง LINE Official Account channel
  - ขอ: Channel ID, Channel Secret, Channel Access Token
  - ทำการตั้งค่า Webhook URL (ได้จากขั้นตอนที่ 3)
  
- [ ] **ทีมสนับสนุน**: มอบหมายคน 2 คน
  - **Admin ระดับ 1** (DevOps/Sysadmin): ดูแล Firebase, logs, backups
  - **Admin ระดับ 2** (Application Support): ตรวจสอบ alerts, users, troubleshooting
  
- [ ] **เครือข่าย**: ตรวจสอบ
  - โรงพยาบาลมี internet 99.5% uptime ขึ้นไป
  - Firewall ยอมให้ HTTPS ไป `firestore.googleapis.com`, `www.googleapis.com`, `api.line.me`
  - ถ้าใช้ VPN: ทดสอบ VPN stability ด้วย ping/speed test

---

### ขั้นตอนติดตั้ง (Week 1)

#### **วันที่ 1-2: Setup Firebase + LINE**

**1. สร้าง Firestore Database**
```bash
# ใน Google Cloud Console → Firebase → Firestore Database → Create Database
# - Location: asia-southeast1 (Thailand)
# - Security rules: Start in production mode (strict)
```

**2. Copy environment variables ลงในไฟล์ .env**
```bash
# ได้มาจาก Firebase Console → Project Settings
FIREBASE_PROJECT_ID=namo-care-bumrungrad
FIREBASE_API_KEY=AIz...
FIREBASE_AUTH_DOMAIN=namo-care-bumrungrad.firebaseapp.com
FIREBASE_STORAGE_BUCKET=namo-care-bumrungrad.appspot.com

# ได้มาจาก LINE Developers Console
LINE_CHANNEL_SECRET=abc123def456
LINE_CHANNEL_ACCESS_TOKEN=Bearer xyz789
```

**3. Deploy Firestore rules + indexes**
```bash
# โหลดไฟล์จากซอร์สโค้ด
firebase deploy --only firestore:rules,firestore:indexes
```

**4. Enable Firestore Point-in-Time Recovery (PITR)**
```bash
# ใน Google Cloud Console → Firestore → Backups
# คลิก "Enable PITR" → ตั้ง retention ไว้ 7 วัน (ค่าแนะนำ)
# ⚠️ ต้องทำมาก่อน go-live (ไม่สามารถ enable ย้อนหลังได้)
```

**Deliverable (Day 1-2):**
- ✅ Firebase project live
- ✅ PITR enabled
- ✅ Firestore rules deployed
- ✅ LINE channel connected

---

#### **วันที่ 3-4: Deploy Backend Functions**

**1. ติดตั้ง Cloud Functions**
```bash
# คำสั่งเดียว (Firebase predeploy hook builds TypeScript → JavaScript)
firebase deploy --only functions
```

**ระหว่างติดตั้ง (5-15 นาที) ทำการตรวจสอบ:**
```bash
# Terminal 2: ดูสถานะการ deploy
firebase functions:list
# Output ควรแสดง:
# ✓ lineWebhook     DEPLOYED
# ✓ medicationReminders DEPLOYED
# ✓ inactivityWatcher  DEPLOYED
# ✓ repatriateData     DEPLOYED
```

**2. ทดสอบ webhook ถูกต้อง**
```bash
# ได้ webhook URL จาก Firebase Console → Functions → lineWebhook
# คัดลอกไปใส่ใน LINE Developers Console → Message API Settings
# → Webhook URL: https://[region]-[project].cloudfunctions.net/lineWebhook
# → Enable Webhook
```

**3. ทดสอบการส่ง message จาก LINE**
- เพิ่ม LINE test account เป็น friend ของ Official Account
- ส่ง message: "ยา" (medicine)
- คาดหวัง: ได้ response "แล้วเด็ก ❤️" ภายใน 2 วินาที

**Deliverable (Day 3-4):**
- ✅ Cloud Functions deployed
- ✅ LINE webhook working
- ✅ Test message received

---

#### **วันที่ 5: Setup Data + Frontend**

**1. Seed demo data (ถ้าต้องการ)**
```bash
cd functions
npm run seed:demo
# สร้างผู้สูงอายุทดสอบ 2 คนกับผู้ดูแล 1 คน
```

**2. Deploy React Dashboard (frontend)**
```bash
# ที่ root directory
npm run build
# นำไฟล์ใน dist/ ไป host บน:
#   - Firebase Hosting (แนะนำ: `firebase deploy --only hosting`)
#   - หรือ Vercel / Netlify (ถ้าต้องการ custom domain)
```

**3. ตั้งค่า custom domain (optional)**
```bash
# Firebase Hosting → Domain → Add custom domain
# ชี้ DNS records ไปที่ Firebase → เสร็จใน 5-30 นาที
```

**Deliverable (Day 5):**
- ✅ Demo data loaded
- ✅ Dashboard live
- ✅ สามารถเข้า https://namo-care.yourhospital.com ได้

---

#### **วันที่ 6-7: Testing + Go-Live Prep**

**Smoke Test Checklist**
```
จากมุมมองผู้สูงอายุ:
  [ ] ส่ง message "ยา กินแล้ว" → ได้ confirmation
  [ ] ส่ง message ฉุกเฉิน → ได้ SOS alert
  
จากมุมมองผู้ดูแล (caregiver):
  [ ] เข้า dashboard ได้ (login ด้วย LINE)
  [ ] เห็นผู้สูงอายุคนนั้น
  [ ] เห็น medication status (confirmed/missed)
  [ ] ได้ notification เมื่อมี alert
  
Admin:
  [ ] เข้า Firestore Console → เห็น data collections
  [ ] ดู logs: firebase functions:log
  [ ] ตรวจสอบ no errors
```

**Performance Baseline**
```bash
# ต้องวัดระดับ "ปกติ" ก่อนให้ผู้ใช้งานจริง
firebase functions:log | grep "duration"
# บันทึก response time แต่ละ function (วนสองครั้ง)
```

**Deliverable (Day 6-7):**
- ✅ ทั้งหมด smoke tests ผ่าน
- ✅ เอกสารการ deploy สำเร็จ

---

### Deployment Success Criteria

| ขั้นตอน | ผ่าน/ไม่ผ่าน | หมายเหตุ |
|---|---|---|
| Firebase + Firestore | ☐ | ✅ ต้องเห็น firestore.googleapis.com ที่ work |
| LINE webhook | ☐ | ✅ ต้องตอบ "200 OK" ภายใน 3 วินาที |
| Cloud Functions | ☐ | ✅ ไม่มี errors ใน logs |
| React Dashboard | ☐ | ✅ หน้า login โหลด |
| Smoke test | ☐ | ✅ ส่ง/ได้ message สำเร็จ |

---

## Monitoring

### ขั้นตอนประจำวัน (Daily Checks)

**เวลา: 09:00 และ 18:00 วันทำการ**

```bash
# Login ไป Firebase Console → Functions → Logs
# ดูคร่าว ๆ 3 สิ่ง:

1. จำนวน ERROR ไม่เกิน 1% ของทั้งหมด
   ✅ OK: 5000 requests, 20 errors = 0.4%
   ❌ ALERT: 100 requests, 50 errors = 50%

2. Response time ไม่เกิน 3 วินาที (p95)
   ✅ OK: avg 500ms, p95 2s
   ❌ ALERT: avg 5s, p95 15s

3. ไม่มี "OutOfMemory" หรือ "Timeout" ใน logs
   ✅ OK: ไม่เห็น error นั้น
   ❌ ALERT: เห็น message นั้น 3+ ครั้ง/วัน
```

---

### ตรวจสอบ Firestore Usage

**เดือนละครั้ง (ช่วงสิ้นเดือน)**

```bash
# Google Cloud Console → Firestore → Stats
# ตรวจสอบ:

1. Document count:
   users: ~[hospital-elderly-count]
   medicationSchedules: ~[hospitals × 100] (assuming avg 100 elderly/hospital)
   
2. Storage:
   เพิ่มขึ้นประมาณ 1-2 MB/เดือน (logs + alerts)
   
3. Operations (Reads/Writes):
   ✅ Normal: ~500 reads, ~100 writes/วัน
   ⚠️ Warning: >5000 reads/วัน (ปกติ? ถ้าหลายโรงพยาบาล)
   ❌ Critical: >50000 reads/วัน (ตรวจสอบ query optimization)
```

---

### Uptime Monitoring

**Firebase SLA:** 99.95% (ตามเอกสาร Google Cloud SLA)

```bash
# ตรวจสอบ uptime รายเดือน:
firebase functions:log --follow
# ดู "UNAVAILABLE" หรือ "503" errors → บันทึกเวลา + ระยะเวลา

ถ้า uptime < 99.9% ในเดือนนั้น:
→ ติดต่อ Google Cloud Support (ถ้าซื้อ support package)
→ หรือตรวจสอบปัญหา networking โรงพยาบาล
```

---

## Logs

### ที่ตั้ง Log Files

**Cloud Functions Logs:**
```
Google Cloud Console → Cloud Functions → namo-care-[name]
→ Logs (JSON format)
```

**Firestore Audit Logs:**
```
Google Cloud Console → Cloud Audit Logs
→ Filter: "firestore.googleapis.com"
→ ดูการเข้าถึงข้อมูล user
```

---

### การอ่าน Log เพื่อหาปัญหา

#### **Log Level ต่าง ๆ:**

| Level | สี | ความหมาย | ต้องทำไร |
|---|---|---|---|
| **DEBUG** | 🟢 เขียว | ข้อมูลเพิ่มเติม | ไม่ต้องทำ |
| **INFO** | 🔵 ฟ้า | เหตุการณ์ปกติ (sent message, deleted user) | ไม่ต้องทำ |
| **WARNING** | 🟡 เหลือง | ปัญหาเล็กน้อย (retry needed, slow query) | ดู trend |
| **ERROR** | 🔴 แดง | ปัญหาร้ายแรง (failed delivery, invalid data) | **ต้องสอบสวน** |
| **CRITICAL** | 🟤 น้ำตาล | ระบบไม่ทำงาน (out of memory, crash) | **ต้องแก้ทันที** |

---

#### **ตัวอย่าง Log Analysis:**

**Example 1: Medication Reminder Failed**
```json
{
  "timestamp": "2026-07-15T14:30:00Z",
  "severity": "WARNING",
  "message": "Failed to send medication reminder",
  "userId": "elderly_001",
  "lineUserId": "U123abc",
  "error": "LINE API returned 429 (rate limited)",
  "retryCount": 1,
  "nextRetryAt": "2026-07-15T14:35:00Z"
}
```
**การแปลค่า:** LINE ส่งข้อความเร็วเกินไป → ระบบจะลองใหม่ในครั้งถัดไป ✅ OK (ไม่ต้องทำ)

---

**Example 2: User Delete Failed**
```json
{
  "timestamp": "2026-07-15T15:00:00Z",
  "severity": "ERROR",
  "message": "Failed to delete user",
  "userId": "elderly_002",
  "action": "execute_deletion",
  "error": "Permission denied: firestore write failed",
  "code": "PERMISSION_DENIED"
}
```
**การแปลค่า:** Firestore rules ปฏิเสธการลบ → ตรวจสอบว่า admin token ถูกต้อง ⚠️ INVESTIGATE

---

#### **Search Log Patterns:**

```bash
# หา ERROR ทั้งหมด
firebase functions:log | grep "severity.*ERROR"

# หา LINE delivery failures
firebase functions:log | grep "Failed to send"

# หา rate limit (การส่งข้อความเร็วเกินไป)
firebase functions:log | grep "429\|rate limit"

# หา user data access (PDPA audit)
firebase functions:log | grep "export_data\|delete_user"
```

---

## Troubleshooting

### ปัญหาทั่วไปและการแก้ไข

---

#### **ปัญหา 1: ผู้สูงอายุไม่ได้รับ Medication Reminder**

**สาเหตุที่มักเป็น:**
1. LINE connection ขาด
2. Elderly's LINE ID ไม่ถูกต้อง
3. Cloud Functions `medicationReminders` scheduler ไม่ทำงาน

**วิธีแก้:**

**Step 1:** ตรวจสอบ LINE connection
```bash
# Firebase Console → Cloud Functions → medicationReminders
# ดู Logs → ตรวจหา "Send medication reminder to U123..."

✅ หากเห็น log: LINE message sent → CONNECTION OK

❌ หากเห็น error: "Failed to send LINE message"
   → ปัญหาที่ LINE หรือ network
   → Restart function: firebase deploy --only functions
```

**Step 2:** ตรวจสอบ elderly's LINE ID
```bash
# Google Cloud Console → Firestore → users collection
# หา user นั้น → ดู field "lineUserId"
# ต้องขึ้นต้นด้วย "U" (เช่น U1234abcd5678xyz)

❌ หากว่าง หรือ ผิดรูปแบบ
   → ให้ผู้สูงอายุ send message ครั้งแรก เพื่อ capture ID
   → Dashboard จะ auto-save ID นั้น
```

**Step 3:** ตรวจสอบ scheduler
```bash
firebase functions:describe medicationReminders
# Output ควรแสดง:
# - status: ACTIVE
# - schedule: "30 7 * * *" (7:30 AM every day)

หากไม่ active:
firebase deploy --only functions:medicationReminders
```

---

#### **ปัญหา 2: Dashboard ช้าหรือมี timeout**

**สาเหตุที่มักเป็น:**
1. Firestore queries มี index ไม่ครบ
2. Internet ช้า (hospital network)
3. ผู้ใช้นั้น ๆ มี permission ปัญหา

**วิธีแก้:**

**Step 1:** ตรวจสอบ network
```bash
# ที่เครื่องผู้ใช้งาน:
ping firestore.googleapis.com
# Response ควร < 100ms (Thailand)
# ❌ หาก > 500ms → ปัญหา network โรงพยาบาล

# ถ้า ping ช้า:
→ ติดต่อ IT โรงพยาบาล ตรวจสอบ internet speed + DNS
```

**Step 2:** ตรวจสอบ Firestore indexes
```bash
# Google Cloud Console → Firestore → Indexes
# ตรวจหา "Status" ของ index นั้น

✅ "Enabled" → ปกติ
🟡 "Building" → รอ build เสร็จ (อาจใช้เวลา 15 นาที)
❌ "Error" → ลองสร้างใหม่ หรือติดต่อ support
```

**Step 3:** ตรวจสอบ permission
```bash
# Firebase Console → Authentication → Users
# หา user นั้น → คลิก → ดู "Custom claims"
# ควรมี: {"role": "caregiver"} หรือ {"role": "admin"}

❌ หากว่าง:
firebase functions:call setUserRole --data '{"uid": "user123", "role": "caregiver"}'
```

---

#### **ปัญหา 3: LINE Webhook ไม่ตอบสนอง (503 / Timeout)**

**สาเหตุที่มักเป็น:**
1. Cloud Functions ไม่ deploy สำเร็จ
2. Environment variable (LINE_CHANNEL_SECRET) หายไป
3. Memory limit exceeded (function crash)

**วิธีแก้:**

**Step 1:** ตรวจสอบ function status
```bash
firebase functions:list
# ค้นหา "lineWebhook" → ควรแสดง "DEPLOYED"

❌ หากแสดง "ERROR" หรือไม่อยู่:
firebase deploy --only functions:lineWebhook
```

**Step 2:** ตรวจสอบ environment variables
```bash
# Google Cloud Console → Cloud Functions → lineWebhook → Runtime settings
# ดู "Runtime environment variables"
# ต้องมี:
# - LINE_CHANNEL_SECRET: [filled]
# - LINE_CHANNEL_ACCESS_TOKEN: [filled]

❌ หากว่าง:
→ คัดลอกจาก .env file ใหม่
→ Firebase deploy ใหม่
```

**Step 3:** ตรวจสอบ memory usage
```bash
firebase functions:log lineWebhook | grep -i memory
# ❌ หากเห็น "Out of memory" หรือ "Killed":
#    → ตรวจสอบ query ที่ดึงข้อมูลเยอะเกินไป
#    → ลองเพิ่ม memory: firebase.json → functions → memory: "512MB"
```

---

#### **ปัญหา 4: ผู้ใช้ไม่สามารถลบข้อมูลตัวเอง (PDPA Deletion)**

**สาเหตุที่มักเป็น:**
1. Firestore rules ไม่อนุญาต repatriateData function
2. Confirmation token หมดอายุ (>48 ชั่วโมง)
3. User ไม่ใช่ owner ของ data นั้น

**วิธีแก้:**

**Step 1:** ตรวจสอบ Firestore rules
```bash
# Firebase Console → Firestore → Rules
# ค้นหา "repatriateData"
# ควรมี rule ที่อนุญาต function ให้ read/write ได้

❌ หากไม่มี:
→ ลง firebase.json สุดท้าย
→ firebase deploy --only firestore:rules
```

**Step 2:** ตรวจสอบ confirmation token
```bash
# Google Cloud Console → Firestore → complianceAuditTrail
# ค้นหา user นั้น → ดู field "confirmationTokenExpiry"
# ต้อง > (ตอนนี้)

❌ หากเป็นอดีต:
→ ให้ user ส่ง request deletion ใหม่ (จะได้ token ใหม่)
→ ต้องใช้ token ใหม่เอา
```

**Step 3:** ตรวจสอบ authorization
```bash
# Firestore → complianceAuditTrail → document นั้น
# ดู field "userId" → ต้องตรงกับ user ที่ส่ง request

❌ หากไม่ตรง:
→ ให้ user ที่เป็นเจ้าของ data ส่ง request เอง (ไม่สามารถ delegate ได้)
```

---

### เมื่อเกิด CRITICAL Issue

**ถ้าปัญหาไม่ได้ในข้อนี้:**

```bash
# Step 1: Collect logs
firebase functions:log > incident_logs.txt
# (บันทึกไว้เพื่อสื่บสวน)

# Step 2: Restart functions (nuclear option)
firebase deploy --only functions
# (ใช้เมื่อ functions hang หรือ crash)

# Step 3: Fallback to manual (if all else fails)
# ส่ง message ไปหา elderly ผ่าน LINE Official Account เองชั่วคราว
# "ระบบรักษาบำรุง พยายามแก้ไขให้เร็ว โปรดลองใหม่ในอีก 15 นาที"

# Step 4: Escalate
# ติดต่อ support team ของ NaMo Care + Google Cloud support
```

---

## Emergency

### ขั้นตอนเมื่อมี Alert Critical

**วิธีดำเนินการ: ภายใน 5 นาที**

```
1. ตรวจสอบ Firebase Console → Cloud Functions
   → ดู "Execution count" และ "Error count"
   
2. ถ้า ERROR > 10% ใน 5 นาทีที่ผ่านมา:
   → ทันทีรี-เซ็ต functions:
      firebase deploy --only functions
   
3. ถ้ายัง Error อยู่:
   → Check environment variables ถูกต้องหรือไม่
   → Restart Firebase Hosting (ถ้าใช้):
      firebase hosting:disable namo-care
      [wait 2 minutes]
      firebase hosting:enable namo-care
   
4. ถ้ายัง Error อยู่ต่อ:
   → Notify caregivers ว่า "ระบบช่วงนี้ช้า" via SMS/Call
   → เลื่อน medication reminders ให้ส่งเมื่อระบบกลับ normal
   
5. ติดต่อ support:
   → Google Cloud Support (ถ้ามี enterprise support)
   → NaMo Care support team
```

---

### Disaster Recovery

**ถ้า Firestore ขาด (หลังจาก PITR enable):**

```bash
# Google Cloud Console → Firestore → Backups
# คลิก "Restore from backup"
# เลือก timestamp ที่มี data ถูกต้อง (เช่น เมื่อ 1 ชั่วโมงที่แล้ว)
# ใช้เวลา 30 นาที - 2 ชั่วโมง สมบูรณ์

เมื่อ restore เสร็จ:
- ข้อมูลหลังจาก restore time จะหาย (ไม่สามารถกู้คืนได้)
- Notify hospital ว่า "อาจสูญเสีย medication records ตั้งแต่ [time]"
- ให้ caregivers re-enter medication data สำหรับช่วงที่หาย
```

---

## Maintenance

### ประจำสัปดาห์

| วัน | ช่วงเวลา | งาน | ระยะเวลา |
|---|---|---|---|
| **วันจันทร์** | 08:00-08:30 | ตรวจสอบ logs จากสุดสัปดาห์ | 30 นาที |
| **วันพุธ** | 18:00-18:15 | ทดสอบ medication reminder | 15 นาที |
| **วันศุกร์** | 16:00-16:30 | Backup check + billing review | 30 นาที |

---

### ประจำเดือน

```bash
# วันที่ 1 ของเดือน (30-60 นาที)

1. Review Firestore usage:
   - Documents count
   - Storage size
   - Operations (reads/writes)
   → บันทึก baseline

2. Check backup:
   - PITR is enabled? ✅
   - Last manual backup: [date]?
   - Backup size reasonable (<1GB)?

3. Security audit:
   - ดู Firestore rules → ยังปลอดภัยหรือไม่
   - ดู function logs → ไม่มี suspicious access?
   - LINE webhook signature validation: ✅

4. Update documentation:
   - Incident log สำหรับเดือนนี้
   - Performance baseline
   - Changes made
   
5. Forecast costs:
   - Current month spend
   - Trend (increasing/decreasing?)
   - Budget remaining
```

---

### ประจำปี

```bash
# ส่วนท้ายปี (ประมาณ 2-3 ชั่วโมง)

1. Security audit (comprehensive):
   - Penetration test ด้วยตนเอง หรือ ขอ third-party
   - PDPA compliance check (โดยเฉพาะ audit trail)
   - Access logs review (ใครเข้าถึง what data)

2. Performance optimization:
   - Firestore queries ที่ช้า → optimize
   - Unused indexes → delete
   - Function memory allocation → adjust ถ้า needed

3. Disaster recovery drill:
   - Test restore จาก backup
   - Test failover (ถ้าเซ็ท up)
   - เอกสารค่อนข้างชัดเจนสำหรับทีมใหม่

4. Budget planning:
   - ประมาณการ costs ปีหน้า
   - Commit purchase discounts (ถ้า GCP)
   - Renewal payment method check
```

---

## PDPA Compliance Checklist

**แต่ละเดือนต้อง verify:**

- [ ] Audit trail ถูก log ทุก access
  ```bash
  firebase functions:log | grep "action.*export\|delete" | wc -l
  # ต้อง > 0 ถ้ามี export/delete เกิด
  ```

- [ ] ไม่มี logs เก่า > 90 วัน
  ```bash
  # Firestore → alertAuditLogs
  # ตรวจหา oldest document
  # ต้อง > (วันนี้ - 90 วัน)
  ```

- [ ] Data export ทำงานถูกต้อง
  ```bash
  # ทดสอบให้ test user export ข้อมูลตัวเอง
  # ต้องได้ ZIP file มี JSON + CSV + checksum
  ```

- [ ] Deletion process (2-step) ทำงาน
  ```bash
  # Step 1: request_deletion → ได้ confirmation token
  # Step 2: confirm_deletion(token) → delete เกิด
  # Step 3: verify user gone from Firestore
  ```

- [ ] Firestore rules ยังปฏิเสธ client access
  ```bash
  # ดู firestore.rules → audit collections
  # ต้อง: allow read, write: if false;
  ```

---

## Emergency Contacts

| บทบาท | ชื่อ | เบอร์โทร | Email |
|---|---|---|---|
| **NaMo Care Support** | [Assigned] | [+66...] | contact@namonexus.com |
| **Google Cloud Support** | [Assigned] | [support link] | [email] |
| **LINE Official Support** | LINE Business | N/A | contact@line.com |
| **Hospital IT Director** | [Name] | [Internal] | [email] |

---

## สรุป

**Key Responsibilities ของ Admin ระดับ 1 (DevOps):**
- Firebase + Cloud Functions deployment + monitoring
- Backups + Disaster recovery
- Firestore rules + security
- Performance tuning
- Billing + cost management

**Key Responsibilities ของ Admin ระดับ 2 (App Support):**
- User access + permission management
- Alert handling + escalation
- PDPA requests (export/delete)
- Log analysis + troubleshooting
- Hospital staff training

---

**Document Version:** 1.0  
**Last Updated:** July 2026  
**Status:** Production Ready  
**Contact:** contact@namonexus.com  

ความเมตตา 🙏
