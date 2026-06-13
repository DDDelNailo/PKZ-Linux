#!/usr/bin/env bash

set -euo pipefail

source /pkz/lib/logging.sh
source /pkz/lib/common.sh
source /pkz/config.sh

step "Configuring Users"

info "Setting root password"
passwd

info "Creating user '$USERNAME'"
useradd -m -G wheel -s /bin/bash "$USERNAME"

info "Setting user password"
passwd "$USERNAME"

info "Configuring sudo"
sed -i \
's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' \
/etc/sudoers

success "Users configured"
