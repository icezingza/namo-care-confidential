# 09 Operations Guide — Sprint 2 Final As-Built

**Classification:** Confidential  
**Baseline:** Firebase / LINE caregiver-alert as-built codebase  
**Last synchronized:** 2026-07-17

## 1. Pre-flight Checklist

1. Confirm the working tree is on the intended release branch (`main`).
2. Set up a Firebase project and a LINE Developers channel for the environment.
3. Copy `.env.example` to `.env.local` and set production-safe client secrets.
4. Confirm Node.js 20+ and the Firebase CLI (`firebase-tools`) are installed on the operator machine.

## 2. Running Verification & Tests

### 2.1 Run Linter & Formatter Checks
Verify codebase quality before any deployment:
```bash
# Run ESLint at root level (Vite app + Functions + Tests)
npm run lint
```

### 2.2 Run Backend Unit & Integration Tests
Execute the Jest test suite inside the `functions` directory:
```bash
cd functions
npm run test
```
The test suite validates:
- **Alert Service**: Threshold clamping, settings configuration, and audit logging.
- **Compliance Service**: Export checksums, 2-step account deletion, and audit trail archiving.
- **Notification Service**: Retry queues, backoff logic, and SMS/LINE channel selection.
- **Medication Reminder Flow**: Alerting caregivers upon consecutive ignored reminders.

### 2.3 Run Smoke Tests on Local Emulator
Verify the runtime integration with the Firebase emulator:
```bash
# Terminal 1: Start the Firestore and Functions emulators
firebase emulators:start --only functions,firestore --project demo-namo-care

# Terminal 2: Seed test data and run happy-path integration verification
cd functions
npm run seed:demo
node scripts/verify-enterprise.js
```

## 3. Production Deployment

### 3.1 Rotate LINE Credentials
Store compromised or reissued credentials securely in Google Secret Manager:
```bash
gcloud secrets create LINE_CHANNEL_SECRET --data-file=- <<< "YOUR_NEW_SECRET_HERE"
gcloud secrets create LINE_CHANNEL_ACCESS_TOKEN --data-file=- <<< "YOUR_NEW_TOKEN_HERE"
```

### 3.2 Enable Point-in-Time Recovery (PITR)
Activate 7-day Firestore data recovery window:
```bash
gcloud firestore databases update --database='(default)' --enable-pitr --project="YOUR_PROJECT_ID"
```

### 3.3 Deploy to Firebase
Deploy all configurations, Firestore rules, and Cloud Functions:
```bash
firebase deploy
```

## 4. Post-Deploy Validation & Monitoring

### 4.1 Monitor Logs
Tail live production logs for incoming LINE webhooks or alert dispatches:
```bash
firebase functions:log --tail
```

### 4.2 Monitor Storage & Queues
- **`deadLetterNotifications` collection**: Investigate if entries appear here, as it indicates permanent LINE/SMS gateway failures.
- **`archivedAuditTrails` collection**: Verify that compliance records are archived successfully upon user deletion requests.
