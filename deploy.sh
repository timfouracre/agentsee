#!/bin/bash
# Deploy agentsee to production server
set -e

SERVER="ubuntu@51.68.235.101"
WEB_DIR="/var/www/agentsee.uk"

echo "Deploying agentsee..."

scp index.html "$SERVER:/tmp/agentsee-index.html"
ssh "$SERVER" "sudo cp /tmp/agentsee-index.html $WEB_DIR/index.html"

echo "Done. Live at https://agentsee.uk"
