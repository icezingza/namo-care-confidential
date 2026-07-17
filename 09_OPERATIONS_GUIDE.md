# 09 Operations Guide — Sprint 2 Final As-Built

**Classification:** Confidential  
**Baseline:** Sprint 2 frozen codebase  
**Last synchronized:** 2026-07-17

## 1. Pre-flight Checklist

1. Confirm the working tree is on the intended release branch.
2. Copy `.env.example` to `.env` and set production-safe secrets.
3. Confirm Docker, Docker Compose v2, `kubectl`, and Helm are installed on the operator machine.
4. Confirm required backing services are available: Postgres, Redis, Qdrant, and Neo4j.

## 2. Running Smoke Tests

Use `smoke-tests.sh` from the repository root to verify the runtime health path and required service fixtures before deployment.

```bash
./smoke-tests.sh
```

The script performs the following sequence:

1. Starts the Docker Compose stack in detached mode.
2. Waits for the API health endpoint to respond on `http://localhost:8000/health`.
3. Runs the integration smoke suite with `pytest tests/evaluation/test_smoke.py -m integration`.
4. Leaves the stack running by default so operators can inspect logs after a failure.

### 2.1 Useful smoke-test commands

```bash
# Run smoke tests with default local endpoint
./smoke-tests.sh

# Override the health URL when validating a forwarded or remote API
API_HEALTH_URL=http://127.0.0.1:8000/health ./smoke-tests.sh

# Tear down the local stack after investigation
COMPOSE_PROFILES= docker compose down
```

### 2.2 Pass/fail criteria

- Pass: `/health` returns HTTP 200 and `runtime` is `healthy`.
- Pass: Postgres, Redis, Qdrant, and Neo4j integration fixtures are available.
- Fail: Any unavailable service, non-200 health response, or failing integration assertion.

## 3. Deployment

### 3.1 Docker Compose deployment

```bash
cp .env.example .env
# Edit .env with production values before starting the stack.
docker compose up -d --build
docker compose ps
curl -fsS http://localhost:8000/health
```

### 3.2 Kubernetes/Helm deployment

The current Kubernetes deployment path uses the Helm chart in `helm/ird-ai` and the helper script `scripts/deploy_k8s.sh`.

```bash
./scripts/deploy_k8s.sh
```

The helper script:

1. Creates or updates the `ird-ai` namespace.
2. Installs the `ird-ai` Helm release using `helm/ird-ai/values.yaml`.
3. Waits up to 300 seconds for pods with label `app=ird-ai` to become ready.
4. Prints pod status.
5. Opens a port-forward from `svc/ird-ai-app` to local port `8000`.

### 3.3 Post-deploy validation

```bash
kubectl get pods -n ird-ai
kubectl logs -n ird-ai deploy/ird-ai --tail=100
curl -fsS http://localhost:8000/health
./smoke-tests.sh
```

## 4. Rollback

```bash
helm rollback ird-ai <REVISION> -n ird-ai
kubectl rollout status deploy/ird-ai -n ird-ai
curl -fsS http://localhost:8000/health
```

If rollback validation fails, collect pod logs, event output, and the smoke-test report before escalating.
