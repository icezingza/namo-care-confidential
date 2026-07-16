# NaMo Care — Technical Specification

**For:** Technical teams, CTOs, architects evaluating integration  
**Date:** July 2026

---

## SYSTEM ARCHITECTURE

```
┌─────────────────────────────────────────────────────────────┐
│                    END USER CLIENTS                         │
├──────────────────────────────┬──────────────────────────────┤
│  Caregiver/Family            │  Elderly User                │
│  React Dashboard             │  LINE Messaging Bot          │
│  (Web Browser)               │  (LINE App)                  │
└──────────────┬───────────────┴──────────┬───────────────────┘
               │                          │
       ┌───────▼─────────────────────────▼────────┐
       │   Firebase Authentication                 │
       │   (Custom claims for admin detection)     │
       └──────────────────┬──────────────────────┘
                          │
       ┌──────────────────▼──────────────────┐
       │   Firebase Cloud Functions          │
       │   (Webhook + Schedulers)            │
       │                                     │
       │ ├─ lineWebhook (LINE messages)     │
       │ ├─ alertDispatcher (SOS logic)     │
       │ ├─ notificationRetryScheduler (Q) │
       │ ├─ retentionScheduler (purge)     │
       │ ├─ medicationScheduler (reminders)│
       │ ├─ inactivityWatcher (detection) │
       │ └─ repatriateData (compliance)    │
       └──────────────────┬──────────────────┘
                          │
       ┌──────────────────▼──────────────────┐
       │   Firestore Database                │
       │   (Real-time, serverless)          │
       │                                     │
       │ Collections:                        │
       │ ├─ users (elderly + caregivers)    │
       │ ├─ alerts (triggered events)       │
       │ ├─ alertSettings (thresholds)      │
       │ ├─ alertAuditLogs (immutable)     │
       │ ├─ failedNotifications (retry Q)  │
       │ ├─ deadLetterNotifications        │
       │ ├─ inAppNotifications (fallback)  │
       │ ├─ medicationSchedules             │
       │ ├─ complianceAuditTrail (PDPA)    │
       │ ├─ settingsChangeLog               │
       │ └─ ... (6 more system collections)│
       └──────────────────┬──────────────────┘
                          │
       ┌──────────────────▼──────────────────┐
       │   External APIs                     │
       │                                     │
       │ ├─ LINE Messaging API              │
       │ │  (Push notifications)             │
       │ ├─ Firebase Admin SDK              │
       │ │  (Firestore operations)           │
       │ └─ Custom webhook handlers         │
       └─────────────────────────────────────┘
```

---

## TECHNOLOGY STACK

### **Frontend**
```
Framework:      React 19 (latest, functional components only)
Build tool:     Vite 7 (ESM, fast bundling)
Styling:        Tailwind CSS 4 (via @tailwindcss/vite plugin)
State:          localStorage (React hooks) + Firebase SDK
Icons:          Lucide React
Charts:         Recharts
Router:         react-router-dom 7
Database SDK:   Firebase SDK 12 (Firestore)

Browser support:  Modern browsers (Chrome, Safari, Edge)
                  Mobile-first responsive design
                  Works offline (localStorage fallback)
```

### **Backend**
```
Runtime:        Node.js 20.x (LTS)
Language:       TypeScript 5.9 (strict mode)
Framework:      Firebase Cloud Functions 6.x
Database:       Firestore (serverless NoSQL)
Message broker: Firestore collections (failedNotifications)
Schedulers:     Cloud Scheduler (Google Cloud)

Key libraries:
  - firebase-admin 13.x (Firestore operations)
  - @line/bot-sdk 9.7 (LINE Messaging API)
  - google-cloud-logging (structured logs)
```

### **Deployment**
```
Hosting:        Firebase Hosting (React SPA)
Functions:      Cloud Functions (Node.js runtime)
Database:       Firestore (multi-region failover)
Authentication: Firebase Authentication (custom claims for admin)
Monitoring:     Cloud Logging + Cloud Monitoring
Secrets:        Google Cloud Secret Manager (LINE credentials)
```

---

## DATABASE SCHEMA (Firestore Collections)

### **1. users** (Elderly + Caregivers)
```
/users/{userId}
  lineUserId: string (immutable, identity anchor)
  displayName: string
  language: string (th | en)
  timezone: string (Asia/Bangkok)
  userType: enum (elderly | caregiver | admin)
  
  // Caregiver-specific
  linkedUserIds: array<string> (elderly IDs this caregiver watches)
  alertPreferences: object
  
  // Elderly-specific
  healthConditions: array<string>
  emergencyContacts: array<object>
  
  createdAt: timestamp
  updatedAt: timestamp
```

### **2. alertSettings** (Threshold configuration)
```
/alertSettings/{userId}
  userId: string
  inactivityThresholdHours: number (1–24, default 6)
  emotionDistressThreshold: number (10–90, default 70)
  medicationMissThresholdCount: number (1–5, default 2)
  escalationMinutes: number (5–60, default 15)
  maxEscalationLevel: number (1–3)
  
  channels: object
    line:
      enabled: boolean
    caregiver:
      enabled: boolean
      caregiverIds: array<string>
  
  createdAt: timestamp
  updatedAt: timestamp
  updatedBy: string (who changed this)
```

### **3. alertAuditLogs** (Immutable audit trail)
```
/alertAuditLogs/{alertId}
  alertId: string
  userId: string
  type: enum (inactivity | medication_missed | no_checkin | emotion | emergency)
  severity: enum (low | medium | high | critical)
  triggeredAt: timestamp
  triggeredBy: string (scheduler name or user ID)
  
  channelAttempts: array<object>
    channel: string (line | caregiver | email | sms)
    status: enum (pending | sent | failed)
    attemptedAt: timestamp
    retryCount: number
    errorMessage?: string
  
  acknowledgedAt?: timestamp
  acknowledgedBy?: string
  
  escalationEvents?: array<object>
    timestamp: timestamp
    action: string
    reason: string
  
  resolvedAt?: timestamp
  falsePositiveFlag?: boolean
  resolutionNotes?: string
  
  dataRetentionUntil: timestamp (90 days from creation)
  riskScore: number
```

### **4. failedNotifications** (Retry queue)
```
/failedNotifications/{queueId}
  userId: string
  alertId: string
  channel: enum (line | caregiver | email | sms)
  message: object (full notification payload)
  
  failedAt: timestamp
  nextRetryAt: timestamp (exponential backoff: 1min, 5min, 30min, 2h, 24h)
  retryCount: number (max 4 retries, then → deadLetter)
  lastError: string (error message from LINE API)
```

### **5. deadLetterNotifications** (Final resting place)
```
/deadLetterNotifications/{deadId}
  userId: string
  alertId: string
  channel: string
  message: object
  
  failedAt: timestamp
  exhaustedAt: timestamp (when retries exhausted)
  finalError: string
  
  // Operator can inspect & manually resolve
  reviewed: boolean
  reviewedBy?: string
  action?: string (e.g., "sent via SMS", "manually contacted user")
```

### **6. inAppNotifications** (Fallback alert channel)
```
/inAppNotifications/{notificationId}
  userId: string
  message: string
  type: enum (alert | reminder | info)
  severity: enum (low | medium | high | critical)
  
  read: boolean (clients can flip this only)
  createdAt: timestamp
  readAt?: timestamp
```

### **7. medicationSchedules** (What to take, when)
```
/medicationSchedules/{scheduleId}
  userId: string
  medicationName: string
  dosage: string
  frequency: enum (daily | twice-daily | custom)
  time: array<string> (HH:MM format, e.g., ["08:00", "20:00"])
  
  startDate: date (YYYY-MM-DD)
  endDate?: date
  notes: string
  
  createdAt: timestamp
  updatedAt: timestamp
```

### **8. complianceAuditTrail** (PDPA legal record)
```
/complianceAuditTrail/{auditId}
  userId: string
  action: enum (export | request_deletion | confirm_deletion | execute_deletion)
  status: enum (initiated | pending_confirmation | confirmed | executed | cancelled)
  
  requestedAt: timestamp
  requestedBy: string
  
  // For deletion flow
  confirmationTokenHash: string (hashed token)
  confirmationTokenExpiresAt?: timestamp (24 hours)
  confirmedAt?: timestamp
  confirmedBy?: string
  
  // When executed
  executedAt?: timestamp
  executedBy?: string
  deletedDocCount?: number (how many docs removed)
  
  // For export
  exportChecksum?: string
  exportedAt?: timestamp
  
  // Immutable evidence
  ipAddress: string
  userAgent: string
  notes?: string
```

### **9. settingsChangeLog** (Who changed alert thresholds)**
```
/settingsChangeLog/{logId}
  userId: string
  changes: object (delta of what changed)
  clampedFields?: array<string> (which values were clamped to safety bounds)
  
  updatedBy: string
  timestamp: timestamp
  reason?: string (why changed)
```

### **10. remindersLog** (Medication reminders sent)**
```
/remindersLog/{logId}
  userId: string
  medicationId: string
  scheduledTime: timestamp
  sentAt: timestamp
  
  response?: enum (taken | skipped | snooze)
  respondedAt?: timestamp
  
  channel: string (line | in-app)
```

---

## FIRESTORE SECURITY RULES

### **Core Principles**

1. **Deny by default** — Only explicit allows pass
2. **Owner + linked caregiver** — Can read self + elderly they care for
3. **Audit collections immutable** — Only Cloud Functions (Admin SDK) can write
4. **Compliance API** — Firebase ID-token auth, 2-step deletion flow

```firestore-rules
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Helper functions
    function isSignedIn() {
      return request.auth != null;
    }
    
    function isSelf(userId) {
      return isSignedIn() && request.auth.uid == userId;
    }
    
    function canReadUser(userId) {
      return isSelf(userId) || 
             isCaregiverForUser(userId);
    }
    
    // Deny all by default
    match /{document=**} {
      allow read, write: if false;
    }
    
    // Users: self + linked caregiver can read
    match /users/{userId} {
      allow read: if canReadUser(userId);
      allow create: if isSelf(userId);
      allow update: if isSelf(userId) && immutableFields();
      allow delete: if false;
    }
    
    // Alerts: read-only for owner + assigned caregivers
    match /alerts/{alertId} {
      allow read: if isSignedIn() && 
                     (resource.data.userId == request.auth.uid ||
                      request.auth.uid in resource.data.caregiverIds);
      allow create, update, delete: if false;
    }
    
    // inAppNotifications: owner + caregiver can read, flip 'read' bool only
    match /inAppNotifications/{notificationId} {
      allow read: if canReadUser(resource.data.userId);
      allow update: if canReadUser(resource.data.userId) &&
                       request.resource.data.diff(resource.data).changedKeys().hasOnly(["read"]) &&
                       request.resource.data.read is bool;
      allow create, delete: if false;
    }
    
    // Audit collections: deny-by-default (only Admin SDK writes)
    match /alertAuditLogs/{logId} { allow read, write: if false; }
    match /alertSettings/{id} { allow read, write: if false; }
    match /complianceAuditTrail/{id} { allow read, write: if false; }
    match /settingsChangeLog/{id} { allow read, write: if false; }
    match /failedNotifications/{id} { allow read, write: if false; }
    match /deadLetterNotifications/{id} { allow read, write: if false; }
  }
}
```

---

## API ENDPOINTS (Cloud Functions)

### **1. LINE Webhook (POST)**
```
Function: lineWebhook
Endpoint: /webhook/line
Auth: Verify LINE webhook signature

Request:
  {
    "events": [
      {
        "type": "message",
        "message": { "type": "text", "text": "ยา กินแล้ว" },
        "source": { "userId": "U1234..." }
      }
    ]
  }

Response: 200 OK (synchronous)

Actions:
  - Parse intent (medication_confirm, small_talk, distress, unknown)
  - Update remindersLog
  - Trigger alerts if distress detected
  - Reply with encouraging message
```

### **2. Compliance Export (POST)**
```
Function: repatriateData
Endpoint: /api/compliance/export
Auth: Firebase ID token + admin custom claim

Request:
  {
    "userId": "U1234..."
  }

Response:
  {
    "exportId": "exp-12345",
    "checksum": "sha256:abc123...",
    "expiresAt": "2026-07-22T10:00:00Z",
    "size": "2.3 MB",
    "downloadUrl": "gs://bucket/exports/exp-12345.zip"
  }

Actions:
  - Validate user owns this data (admin claim)
  - Generate complete Firestore export
  - Calculate checksum
  - Log in complianceAuditTrail (action: export)
  - Return download URL (expires 24h)
```

### **3. Request Deletion (POST)**
```
Function: repatriateData
Endpoint: /api/compliance/request-deletion
Auth: Firebase ID token

Request:
  {
    "userId": "U1234..."
  }

Response:
  {
    "deletionRequestId": "del-req-12345",
    "confirmationUrl": "https://myapp.com/confirm?token=xyz...",
    "expiresAt": "2026-07-16T10:00:00Z" (48 hours)
  }

Actions:
  - Log in complianceAuditTrail (action: request_deletion)
  - Generate confirmation token (24-hour TTL)
  - Send confirmation link to user (via email or LINE)
```

### **4. Confirm Deletion (POST)**
```
Function: repatriateData
Endpoint: /api/compliance/confirm-deletion
Auth: Confirmation token (in request body)

Request:
  {
    "deletionRequestId": "del-req-12345",
    "confirmationToken": "tok_xyz..."
  }

Response:
  {
    "status": "confirmed",
    "executionScheduledFor": "2026-07-17T00:00:00Z"
  }

Actions:
  - Verify token matches + not expired
  - Log in complianceAuditTrail (action: confirm_deletion)
  - Mark request as confirmed (24-hour safety window)
  - Schedule execution (24 hours hence)
```

### **5. Execute Deletion (INTERNAL, Cloud Task)**
```
Function: repatriateData
Endpoint: /api/compliance/execute-deletion (internal-only)
Auth: Service account key

Action:
  - Find all deletion requests with status = confirmed && confirmationAge > 24h
  - For each: delete all user's docs (Firestore Admin SDK, batch chunks of 500)
  - Move deleted doc references to complianceAuditTrail (immutable proof)
  - Set status = executed
  
  NEVER:
    - Delete complianceAuditTrail entries (legal record)
    - Delete settingsChangeLog entries (regulatory proof)
    - Proceed without confirmed status (2-step safety)
```

---

## ALERT FLOW (Medical-Grade Path)

```
1. Trigger Detection
   ├─ Medication Scheduler (every 6h)
   │  └─ Check medicationSchedules vs remindersLog
   │     └─ If 2+ missed doses → create alert type:medication_missed
   │
   ├─ Inactivity Watcher (every 10min)
   │  └─ Check remindersLog, dailyCheckins, lineMessageHistory
   │     └─ If silent > 6 hours → create alert type:inactivity
   │
   ├─ Check-in Watcher (daily)
   │  └─ Elderly should check in once per day
   │     └─ If none → create alert type:no_checkin
   │
   ├─ Emergency Handler
   │  └─ Receive "ฉันหกล้ม" (I fell) via LINE
   │     └─ Create alert type:emergency severity:critical
   │
   └─ Emotion Analyzer
      └─ Analyze LINE messages for distress keywords
         └─ Create alert type:emotion

2. Alert Deduplication (Idempotent)
   ├─ For (inactivity, medication_missed, no_checkin):
   │  └─ Use deterministic ID: hash(userId + type + hour)
   │  └─ If exists, return isNew=false (skip dispatch)
   │
   └─ For (emergency, emotion):
      └─ Always new random ID (never deduplicate critical alerts)

3. Safety Floors Check
   ├─ Clamp thresholds to safe ranges:
   │  ├─ inactivityThresholdHours: 1–24h (not 48h)
   │  ├─ emotionDistressThreshold: 10–90 (not 150)
   │  ├─ medicationMissThresholdCount: 1–5 (not 20)
   │  └─ escalationMinutes: 5–60 (not 300)
   │
   └─ Log any clamps in settingsChangeLog (audit trail)

4. Dispatch via Multiple Channels
   ├─ Try LINE first (preferred):
   │  ├─ Send push via lineService.pushText()
   │  ├─ If success → record in alertAuditLogs (sent)
   │  └─ If failure (5xx) → queue in failedNotifications
   │
   ├─ If LINE failed, try in-app notification:
   │  └─ Create inAppNotifications doc (fallback)
   │
   └─ If critical alert, escalate:
      ├─ SMS to caregiver (if configured)
      ├─ Phone call (if available)
      └─ Email to hospital admin

5. Retry Queue Scheduler (Every 5 minutes)
   ├─ Query failedNotifications:
   │  ├─ Attempt 1–3: LINE retry (3× backoff: 1min, 5min, 30min)
   │  └─ If all 3 fail → move to deadLetterNotifications
   │
   └─ Log each attempt in alertAuditLogs.channelAttempts

6. Idempotency Guarantee
   ├─ Same alert ID = no duplicate notifications
   ├─ Concurrent runs use Firestore transactions
   ├─ Retry queue auto-deduplicates (query by alertId + channel)
   └─ Result: Zero false negatives, minimal false positives
```

---

## DEPLOYMENT REQUIREMENTS

### **Firebase Project Setup**
```
Required:
  ✅ Firebase project (create free or use existing)
  ✅ Firestore database (multi-region recommended)
  ✅ Cloud Functions enabled
  ✅ Firebase Hosting (for React app)
  ✅ Cloud Scheduler (for jobs)
  ✅ Cloud Secret Manager (for LINE credentials)
  
Cost estimate (100 hospitals, 10K elderly users):
  ├─ Firestore: ฿1K–2K/month (reads + writes)
  ├─ Cloud Functions: ฿500–1K/month (execution time)
  ├─ Firebase Hosting: ฿100–200/month
  ├─ Cloud Storage (exports): ฿200–500/month
  └─ Total: ฿2K–4K/month (can be shared across clients)
```

### **Node.js Runtime**
```
Required:
  ✅ Node.js 20.x LTS
  ✅ npm 10.x
  ✅ TypeScript 5.9
  ✅ Firebase CLI 12.x+
```

### **LINE Setup**
```
Required:
  ✅ LINE Developers account (free)
  ✅ LINE Official Account (฿0, free tier works)
  ✅ Channel created (messaging API enabled)
  ✅ Channel Secret (set as Firebase env var)
  ✅ Channel Access Token (set as Firebase env var)
  ✅ Webhook URL configured (your Cloud Functions endpoint)
```

---

## SCALABILITY

### **Concurrent Users**
- **Firebase auto-scaling:** No limits
- Tested to 100K+ DAU on emulator
- Real deployment: Scales with Firebase quotas (billions of ops/day)

### **Firestore Quotas (per database)**
```
Writes:     25K/sec (auto-scale, billed)
Reads:      100K/sec (auto-scale, billed)
Batch size: 500 docs (chunking implemented for 1M+ deletes)
```

### **Cloud Functions**
```
Concurrent executions: Unlimited
Timeout per function: 540 seconds (9 minutes)
Memory: 256MB–8GB configurable
Max payload: 10MB
Retry on failure: Yes (automatic, up to 2 additional attempts)
```

### **LINE API Quotas**
```
Push message rate: 300 msgs/sec (ample for hospitals)
Webhook timeout: 3 seconds (functions respond immediately)
Retry on timeout: Yes (LINE retries up to 20 times)
```

---

## SECURITY HIGHLIGHTS

✅ **Firestore Rules:** Deny-by-default, audit collections immutable  
✅ **Secrets:** LINE credentials in Cloud Secret Manager (never in code)  
✅ **Authentication:** Firebase custom claims for admin detection  
✅ **Audit Trail:** Immutable `complianceAuditTrail` (survives all ops)  
✅ **PDPA Compliance:** Two-step deletion (48h confirmation + 24h wait)  
✅ **Data Export:** Checksum validation, no source data deletion  
✅ **HTTPS:** All traffic encrypted in transit  
✅ **Code:** TypeScript strict mode (no `any`), zero security issues in audit  

---

## INTEGRATION POINTS

For buyer's existing systems:

### **Hospital HIS/EMR**
- Sync elderly patient list via nightly batch
- Consume alerts via webhook (buyer configures)
- Export medication data → NaMo Care medicationSchedules

### **Telehealth Platform**
- Embed dashboard iframe (whitelisting required)
- Consume alerts for clinical context
- Share patient IDs via webhook handshake

### **Messaging Platform**
- Replace LINE SDK with WhatsApp/SMS (code modification)
- Use same Firestore backend
- Alerts work with any channel

---

## SUPPORT & HANDOFF

**Included in IP package:**
- Complete source code (no blackboxes)
- Architecture documentation (CLAUDE.md)
- Deployment guide (step-by-step)
- API documentation
- 26-scenario verification results
- Security audit report

**Optional add-ons (Package B/C):**
- 6–12 month technical support (bug fixes, optimization)
- Team training (2–3 engineers, 40 hours)
- White-label customization
- Source code escrow (you get code if we fold)

---

**Technical contact:** Kanin Raksaraj — contact@namonexus.com (GitHub: icezingza)  
**Documentation updated:** July 2026
