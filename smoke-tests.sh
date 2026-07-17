#!/usr/bin/env bash
set -euo pipefail

API_HEALTH_URL="${API_HEALTH_URL:-http://localhost:8000/health}"
COMPOSE_FILE="${COMPOSE_FILE:-docker-compose.yml}"
TIMEOUT_SECONDS="${TIMEOUT_SECONDS:-90}"

printf 'Starting local stack with %s...\n' "$COMPOSE_FILE"
docker compose -f "$COMPOSE_FILE" up -d

printf 'Waiting for API health at %s...\n' "$API_HEALTH_URL"
end=$((SECONDS + TIMEOUT_SECONDS))
until curl -fsS "$API_HEALTH_URL" >/tmp/ird-ai-health.json; do
  if (( SECONDS >= end )); then
    printf 'Timed out waiting for API health. Last docker compose status:\n' >&2
    docker compose -f "$COMPOSE_FILE" ps >&2
    exit 1
  fi
  sleep 3
done

cat /tmp/ird-ai-health.json
printf '\nRunning integration smoke tests...\n'
pytest tests/evaluation/test_smoke.py -m integration
