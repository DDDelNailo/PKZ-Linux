#!/usr/bin/env bash

set -euo pipefail

source ./config.sh

echo "PKZ Linux Installer"

./scripts/install/01-partition.sh

echo
echo "Installation complete."
echo "You may now reboot."
