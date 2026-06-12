#!/usr/bin/env bash

set -euo pipefail

source "$PROJECT_ROOT/config.sh"

echo "====================================="
echo "PKZ Linux - Partitioning"
echo "====================================="
echo
echo "Target disk: $DISK"
echo

lsblk "$DISK"

echo
echo "WARNING!"
echo "This will erase ALL data on:"
echo "  $DISK"
echo

read -rp "Type YES to continue: " CONFIRM

if [[ "$CONFIRM" != "YES" ]]; then
echo "Aborted."
exit 1
fi

echo
echo "Creating GPT partition table..."

parted -s "$DISK" mklabel gpt

echo "Creating EFI partition..."

parted -s "$DISK" mkpart ESP fat32 1MiB 513MiB

parted -s "$DISK" set 1 esp on

echo "Creating Btrfs root partition..."

parted -s "$DISK" mkpart primary btrfs 513MiB 100%

echo
echo "Partitioning complete."
echo

partprobe "$DISK"

sleep 2

lsblk "$DISK"



# Configured disk: /dev/sda

# Detected:
# - /dev/sda (40G)
# - /dev/sdb (128G)

# Install to /dev/sda? [y/N]
