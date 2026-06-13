#!/usr/bin/env bash

set -euo pipefail

source /pkz/lib/logging.sh
source /pkz/lib/common.sh
source /pkz/config.sh

step "Installing Bootloader"

require_command bootctl
require_command blkid

bootctl install

info "Creating loader configuration"

mkdir -p /boot/loader
mkdir -p /boot/loader/entries

cat > /boot/loader/loader.conf <<EOF
default arch.conf
timeout 3
editor no
EOF

ROOT_PARTITION="$(
    get_partition_path "$DISK" 2
)"

ROOT_PARTUUID="$(
    blkid -s PARTUUID -o value "$ROOT_PARTITION"
)"

info "Creating boot entry"

cat > /boot/loader/entries/arch.conf <<EOF
title PKZ Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root=PARTUUID=${ROOT_PARTUUID} rw
EOF

success "Bootloader configured"
