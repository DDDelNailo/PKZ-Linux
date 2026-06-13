#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "$0")" && pwd)"
export PROJECT_ROOT

source "$PROJECT_ROOT/lib/common.sh"
source "$PROJECT_ROOT/lib/logging.sh"

step "PKZ Linux Installer"
bash "$PROJECT_ROOT/install/01-partition.sh"
bash "$PROJECT_ROOT/install/02-filesystems.sh"
bash "$PROJECT_ROOT/install/03-mount.sh"
bash "$PROJECT_ROOT/install/04-pacstrap.sh"
# bash "$PROJECT_ROOT/install/05-chroot.sh"
success "Stage 1 complete: Base system installed."

success "Installation complete."
info "You may now reboot."
