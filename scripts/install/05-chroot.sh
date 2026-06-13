#!/usr/bin/env bash

set -euo pipefail

source "$PROJECT_ROOT/lib/logging.sh"
source "$PROJECT_ROOT/lib/ui.sh"
source "$PROJECT_ROOT/lib/common.sh"

require_root

step "Preparing Chroot Environment"
load_config
require_command cp
require_command arch-chroot

mkdir -p /mnt/pkz

cp -r \
"$PROJECT_ROOT/chroot" \
/mnt/pkz/

success "Project files copied"

step "Entering Chroot"

arch-chroot /mnt bash /pkz/chroot/run.sh

success "Chroot stage completed"
