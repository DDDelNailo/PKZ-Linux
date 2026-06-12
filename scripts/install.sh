#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "$0")" && pwd)"
export PROJECT_ROOT

source "$PROJECT_ROOT/config.sh"

echo "PKZ Linux Installer"

bash "$PROJECT_ROOT/install/01-partition.sh"

echo
echo "Installation complete."
echo "You may now reboot."
