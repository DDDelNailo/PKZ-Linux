#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "$0")" && pwd)"
export PROJECT_ROOT

source "$PROJECT_ROOT/lib/common.sh"
source "$PROJECT_ROOT/lib/logging.sh"

step "PKZ Linux Installer"

loading "Loading config..."
source "$PROJECT_ROOT/config.sh"
loading_done

bash "$PROJECT_ROOT/install/01-partition.sh"

success "Installation complete."
info "You may now reboot."
