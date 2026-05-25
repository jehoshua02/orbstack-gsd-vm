#!/usr/bin/env bash
set -euo pipefail

VM_NAME="gsd"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SNAPSHOT="${SCRIPT_DIR}/${VM_NAME}-snapshot.tar"

if [ ! -f "$SNAPSHOT" ]; then
  echo "No snapshot found at ${SNAPSHOT}"
  echo "Run ./up.sh first to create one."
  exit 1
fi

if orb list | grep -q "^${VM_NAME} "; then
  echo "WARNING: VM '${VM_NAME}' already exists."
  echo "Restoring will DELETE the current VM and all its data."
  read -rp "Continue? [y/N] " confirm
  if [[ "$confirm" != [yY] ]]; then
    echo "Aborted."
    exit 0
  fi
  orb delete "$VM_NAME" -f
fi

echo "Importing snapshot..."
orb import "$SNAPSHOT" "$VM_NAME"
orb start "$VM_NAME" 2>/dev/null || true
echo "VM '${VM_NAME}' restored. Run: orb -m ${VM_NAME}"
