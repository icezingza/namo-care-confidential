# 09_OPERATIONS_GUIDE: Handoff & Maintenance

**Status:** Async-First Delivery Ready  
**Target:** DevOps and Operational Partners

## 1. Async-First Communication Protocol
To ensure operational efficiency and maintain a medical-grade Service Level Agreement (SLA), all handoff and operational coordination should follow the **Async-First** methodology:
- Avoid synchronous "standups" or meetings unless critical incident resolution is needed.
- Use issue trackers (e.g., Jira, GitHub Issues) for all feature requests, bug reports, and SLA monitoring.
- All technical documentation, runbooks, and architectures are pre-recorded or written. (See `03_TECHNICAL_SPEC.md` and Demo Video).

## 2. Infrastructure Setup & Demarcation
### Firebase & Google Cloud Platform
- Buyer is responsible for creating their own Google Cloud and Firebase projects.
- Firestore Security Rules (`firestore.rules`) must be deployed exactly as provided to maintain the 403 Deny-By-Default standard.
- Any failure resulting from quota exhaustion (e.g., reaching daily Cloud Function invocations limit) is explicitly outside of NaMo Care's SLA responsibilities.

### LINE Official Account
- Buyer must register and maintain their own LINE Official Account and Messaging API channel.
- Ensure Webhook URLs are accurately configured to point to the production Cloud Function endpoint.

## 3. Incident Management & Source Code Escrow
### Emergency Trigger
- In the event of a catastrophic failure or inability to reach the NaMo Care support team within the specified timeframe (48 hours), the Source Code Escrow clause may be triggered (if Package C is purchased).
- See `IP_PURCHASE_AGREEMENT_TEMPLATE.md` for full legal terms.

### Monitoring & Dead Letters
- Follow the guidelines in `docs/MONITORING.md` to set up Google Cloud Logging Alerts for the `deadLetterNotifications` collection.
- Configure alerting policies to notify the appropriate DevOps channels immediately upon critical failures.
