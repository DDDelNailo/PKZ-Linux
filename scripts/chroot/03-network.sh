#!/usr/bin/env bash

set -euo pipefail

source /pkz/lib/logging.sh

step "Configuring Network"

systemctl enable NetworkManager

success "Network configured"