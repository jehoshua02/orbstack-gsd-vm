#!/usr/bin/env bash
set -euo pipefail

VM_NAME="gsd"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Create VM if it doesn't exist
if ! orb list | grep -q "^${VM_NAME} "; then
  echo "Creating VM '${VM_NAME}'..."
  orb create ubuntu "$VM_NAME"
else
  # Start if stopped
  orb start "$VM_NAME" 2>/dev/null || true
fi

# Push and run setup
orb push -m "$VM_NAME" "${SCRIPT_DIR}/setup.sh" /tmp/setup.sh
orb run -m "$VM_NAME" bash /tmp/setup.sh

# Verify
echo ""
echo "=== Verification ==="
orb run -m "$VM_NAME" bash -c '
  echo "git:        $(git --version)"
  echo "docker:     $(docker --version)"
  echo "node:       $(node --version)"
  echo "npm:        $(npm --version)"
  echo "gsd:        $(gsd --version 2>&1 || echo "NOT FOUND")"
  echo "claude:     $(claude --version 2>&1 || echo "NOT FOUND")"
'
echo ""
echo "VM '${VM_NAME}' is ready. Run: orb shell ${VM_NAME}"
