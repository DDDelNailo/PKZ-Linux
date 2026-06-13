#!/usr/bin/env bash

set -euo pipefail

source /pkz/lib/logging.sh
source /pkz/lib/common.sh
source /pkz/config.sh

step "Configuring Localization"
require_command ln
require_command locale-gen

info "Setting hostname"
echo "$HOSTNAME" > /etc/hostname

info "Setting timezone"
ln -sf "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime

info "Configuring locale"
sed -i "s/^#${LANGUAGE}/${LANGUAGE}/" /etc/locale.gen

locale-gen
cat > /etc/locale.conf <<EOF
LANG=$LANGUAGE
EOF

info "Configuring keyboard layout"
cat > /etc/vconsole.conf <<EOF
KEYMAP=$KEYMAP
EOF
loadkeys br-abnt2

success "Localization configured"
