require_root() {
    if [[ "$EUID" -ne 0 ]]; then
        echo "This script must be run as root."
        exit 1
    fi
}

require_command() {
    local command="$1"
    
    if ! command -v "$command" >/dev/null 2>&1; then
        echo "Required command not found: $command"
        exit 1
    fi
}

load_config() {
    loading "Loading config"
    
    source "$PROJECT_ROOT/config.sh"
    
    loading_done
}

list_disks() {
    while read -r disk size; do
        echo "- $disk ($size)"
        done < <(
        lsblk -dno PATH,SIZE | grep "^/dev/sd\|^/dev/nvme\|^/dev/vd"
    )
}

get_partition_path() {
    local disk="$1"
    local number="$2"
    
    if [[ "$disk" =~ nvme ]]; then
        echo "${disk}p${number}"
    else
        echo "${disk}${number}"
    fi
}

is_mounted() {
    local path="$1"
    
    mountpoint -q "$path"
}