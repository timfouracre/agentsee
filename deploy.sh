#!/bin/bash
set -euo pipefail

SERVER="ubuntu@51.68.235.101"
APP_DIR="/var/www/agentsee.uk"
BRANCH="main"

CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"

if [ "$CURRENT_BRANCH" != "$BRANCH" ]; then
  echo "Deploys must be run from local $BRANCH. Current branch: $CURRENT_BRANCH" >&2
  exit 1
fi

LOCAL_HEAD="$(git rev-parse HEAD)"
REMOTE_HEAD="$(git rev-parse "origin/$BRANCH")"

if [ "$LOCAL_HEAD" != "$REMOTE_HEAD" ]; then
  echo "Local HEAD is not pushed to origin/$BRANCH." >&2
  echo "Push your changes first, then deploy." >&2
  exit 1
fi

echo "Deploying AgentSee from $(git rev-parse --short HEAD) to $SERVER:$APP_DIR"

ssh -o StrictHostKeyChecking=accept-new "$SERVER" "
  set -euo pipefail
  git -C '$APP_DIR' fetch origin
  git -C '$APP_DIR' pull --ff-only origin '$BRANCH'
"

echo "Deploy complete: https://agentsee.uk"
