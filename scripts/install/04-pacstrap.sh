#!/usr/bin/env bash

set -euo pipefail

source "$PROJECT_ROOT/lib/logging.sh"
source "$PROJECT_ROOT/lib/ui.sh"
source "$PROJECT_ROOT/lib/common.sh"

require_root

step "Installing Base System"
load_config
require_command pacstrap

BASE_PACKAGES=(
    base
    linux
    linux-firmware
    btrfs-progs
    networkmanager
    sudo
    vim
)

info "Base packages to install: ${BASE_PACKAGES[*]}"

if ! confirm_action "Install base system with packages: ${BASE_PACKAGES[*]}?"; then
    warn "Operation cancelled."
    exit 1
fi

info "Installing packages"
pacstrap -K /mnt "${BASE_PACKAGES[@]}"

success "Base system installed"
