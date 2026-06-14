#!/usr/bin/env bash

set -euo pipefail

source "$PROJECT_ROOT/lib/logging.sh"

step "Cleaning Installation Environment"

if confirm_action "Unmount installation target?"; then
    if mountpoint -q /mnt; then
        umount -R /mnt
        success "Unmounted /mnt"
    else
        info "/mnt is not mounted"
    fi
fi
