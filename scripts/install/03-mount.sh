#!/usr/bin/env bash

set -euo pipefail

source "$PROJECT_ROOT/lib/logging.sh"
source "$PROJECT_ROOT/lib/ui.sh"
source "$PROJECT_ROOT/lib/common.sh"

require_root

step "Mounting Filesystems"
load_config
require_command mount
require_command mkdir

EFI_PARTITION="$(get_partition_path "$DISK" 1)"
ROOT_PARTITION="$(get_partition_path "$DISK" 2)"

info "Root partition: $ROOT_PARTITION"
info "EFI partition: $EFI_PARTITION"

echo
if ! confirm_action "Mount $ROOT_PARTITION to /mnt and $EFI_PARTITION to /mnt/boot?"; then
    warn "Operation cancelled."
    exit 1
fi

info "Mounting root partition"
mount "$ROOT_PARTITION" /mnt

info "Creating boot directory"
mkdir -p /mnt/boot

info "Mounting EFI partition"
mount "$EFI_PARTITION" /mnt/boot

success "Filesystems mounted"
