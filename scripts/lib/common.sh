# lib/common.sh

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
    
    done_msg
}
