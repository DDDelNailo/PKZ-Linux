confirm_action() {
    local prompt="${1:-Continue?}"
    local response
    
    while true; do
        read -r -p "$prompt (y/n): " response
        
        case "$response" in
            [yY]|[yY][eE][sS])
                return 0
            ;;
            
            [nN]|[nN][oO])
                return 1
            ;;
            
            *)
                echo "Invalid input. Please enter y or n."
            ;;
        esac
    done
}

ask_input() {
    local prompt="$1"
    local value
    
    read -r -p "$prompt: " value
    
    echo "$value"
}

ask_input_default() {
    local prompt="$1"
    local default="$2"
    local value
    
    read -r -p "$prompt [$default]: " value
    
    echo "${value:-$default}"
}
