#!/usr/bin/env bash
set -euo pipefail

# Namo Care: Serverless Smoke Tests via Firebase Emulator

printf 'Starting Firebase Emulators for smoke testing...\n'

# We assume the main project repository is in the adjacent directory
PROJECT_DIR="../namo-care-1"

if [ ! -d "$PROJECT_DIR" ]; then
  printf "Error: Main project directory %s not found.\n" "$PROJECT_DIR" >&2
  exit 1
fi

cd "$PROJECT_DIR"

# Execute E2E tests within the Firebase Emulator suite
# The emulator automatically spins up Firestore, Functions, etc., runs the tests, and shuts down safely.
firebase emulators:exec "npx playwright test tests/e2e/negative-scenarios.spec.ts" --project demo-namo-care

printf '\nSmoke tests completed successfully.\n'
