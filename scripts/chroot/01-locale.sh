#!/usr/bin/env bash

set -euo pipefail

read -rp "Target disk (example: /dev/sda): " DISK

echo
echo "WARNING: Everything on $DISK will be erased."
read -rp "Continue? [y/N] " CONFIRM

[[ "$CONFIRM" == "y" ]]

parted -s "$DISK" mklabel gpt

parted -s "$DISK" mkpart ESP fat32 1MiB 513MiB
parted -s "$DISK" set 1 esp on

parted -s "$DISK" mkpart primary btrfs 513MiB 100%

echo "Partitioning complete."

