# 07 Pitch Deck Outline — Sprint 2 Freeze

**Classification:** Confidential  
**Baseline:** Sprint 2 frozen codebase  
**Last synchronized:** 2026-07-17

## Slide 1 — Title

**Namo Care: Reliable Medication Adherence for Care Teams**  
Confidential Sprint 2 freeze narrative.

## Slide 2 — Problem

Medication adherence workflows still rely on manual follow-up, delayed escalation, and fragmented caregiver visibility.

## Slide 3 — Solution

Namo Care delivers a medication-reminder workflow with deterministic alert states, auditable transitions, and caregiver escalation for missed acknowledgements.

## Slide 4 — Product Workflow

- Medication reminder is scheduled.
- Alert becomes due and primary notification is sent.
- Patient acknowledges, snoozes, or misses the reminder.
- Caregiver/admin escalation is triggered when the acknowledgement grace period is exceeded.
- Final adherence or escalation outcome is persisted for audit.

## Slide 5 — Sprint 2 Technical Win

- Medication-alert state machine frozen for Sprint 2.
- Idempotent terminal states protect against duplicate adherence records.
- Smoke-test workflow formalized for release validation.
- 100% Serverless deployment path via Google Cloud Functions and Firestore (Zero DevOps overhead).

## Slide 6 — Performance Win

- Sprint 2 final alert latency baseline: **~485 ms**.
- Operational target: **< 500 ms**.
- Result: latency target met with release-blocker threshold documented for future regressions.

## Slide 7 — Trust & Safety

- Auditable reminder lifecycle.
- Explicit escalation path for unacknowledged medication alerts.
- Terminal-state replay safety for worker retries and restart recovery.

## Slide 8 — Operations & Cost Efficiency

- Serverless architecture removes DevOps, scaling automatically to millions of users.
- Firebase Emulator suite supports local runtime smoke validation without production risk.
- Zero server maintenance drastically reduces hospital IT overhead (saving ฿1,000–2,000/month per site).

## Slide 9 — Current Status

Sprint 2 is frozen with the core medication-alert logic, performance baseline, smoke-test runbook, and deployment runbook synchronized to the as-built codebase.

## Slide 10 — Next Milestones

- Broaden UAT coverage for caregiver escalation scenarios.
- Add dashboard reporting for adherence trends and missed-dose review.
- Continue latency monitoring against the <500 ms release gate.
