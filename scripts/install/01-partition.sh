#!/usr/bin/env bash

set -euo pipefail

source "$PROJECT_ROOT/lib/logging.sh"
source "$PROJECT_ROOT/lib/ui.sh"
source "$PROJECT_ROOT/lib/common.sh"

require_root
load_config

step "Partitioning Disk"
require_command parted

info "Detected:"
list_disks

echo
info "Configured disk: $DISK"

echo
if ! confirm_action "Install to $DISK?"; then
    warn "Operation cancelled."
    exit 1
fi

info "Creating GPT partition table"
parted -s "$DISK" mklabel gpt

info "Creating EFI partition"
parted -s "$DISK" mkpart ESP fat32 1MiB "$EFI_SIZE"
parted -s "$DISK" set 1 esp on

info "Creating root partition"
parted -s "$DISK" mkpart primary btrfs "$EFI_SIZE" 100%
partprobe "$DISK"

success "Partitioning completed"