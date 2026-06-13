#!/usr/bin/env bash

set -euo pipefail

bash /pkz/chroot/01-locale.sh
bash /pkz/chroot/02-users.sh
bash /pkz/chroot/03-network.sh
bash /pkz/chroot/04-bootloader.sh
bash /pkz/chroot/05-finish.sh
