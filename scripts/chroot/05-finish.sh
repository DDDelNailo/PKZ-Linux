
#!/usr/bin/env bash

set -euo pipefail

source /pkz/lib/logging.sh

step "Finalizing Installation"

mkinitcpio -P

success "Installation complete"
success "You may now reboot into PKZ Linux"
