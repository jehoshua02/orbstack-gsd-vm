#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
sudo apt-get install -y git ca-certificates curl

# Docker (official convenience script)
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker "$USER"

# Node.js (via NodeSource LTS)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# GSD Pi
sudo npm install -g @opengsd/gsd-pi@latest

# Claude Code
curl -fsSL https://claude.ai/install.sh | bash
