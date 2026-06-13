#!/usr/bin/env bash

set -euo pipefail

source "$PROJECT_ROOT/lib/logging.sh"
source "$PROJECT_ROOT/lib/ui.sh"
source "$PROJECT_ROOT/lib/common.sh"

require_root

step "Creating Filesystems"
load_config
require_command mkfs.fat
require_command mkfs.btrfs

EFI_PARTITION="$(get_partition_path "$DISK" 1)"
ROOT_PARTITION="$(get_partition_path "$DISK" 2)"

info "EFI partition: $EFI_PARTITION"
info "Root partition: $ROOT_PARTITION"

TYPE="$(
    blkid -s TYPE -o value "$ROOT_PARTITION" 2>/dev/null || true
)"

if [[ -n "$TYPE" ]]; then
    warn "$ROOT_PARTITION already contains a $TYPE filesystem"
fi

echo
if ! confirm_action "Format $EFI_PARTITION as FAT32 and $ROOT_PARTITION as Btrfs?"; then
    warn "Operation cancelled."
    exit 1
fi

info "Formatting EFI partition"
mkfs.fat -F32 "$EFI_PARTITION"

info "Formatting root partition"
mkfs.btrfs -f "$ROOT_PARTITION"

success "Filesystems created"
