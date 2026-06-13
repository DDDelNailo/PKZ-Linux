confirm_action() {
    local prompt="${1:-Continue?}"
    local response
    
    while true; do
        if ! read -r -p "$prompt (y/n): " response; then
            echo
            echo "READ FAILED"
            return 1
        fi
        
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

# confirm_action() {
#     local prompt="${1:-Continue?}"
#     local response

#     while true; do
#         read -r -p "$prompt (y/n): " response

#         case "$response" in
#             [yY]|[yY][eE][sS])
#                 return 0
#             ;;

#             [nN]|[nN][oO])
#                 return 1
#             ;;

#             *)
#                 echo "Invalid input. Please enter y or n."
#             ;;
#         esac
#     done
# }

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

select_option() {
    local prompt="$1"
    shift
    
    local options=("$@")
    local choice
    
    echo >&2
    echo "$prompt" >&2
    echo >&2
    
    for i in "${!options[@]}"; do
        printf "%d) %s\n" "$((i + 1))" "${options[$i]}" >&2
    done
    
    echo >&2
    
    while true; do
        read -r -p "Choice: " choice
        
        if [[ "$choice" =~ ^[0-9]+$ ]] &&
        (( choice >= 1 && choice <= ${#options[@]} )); then
            
            echo "${options[$((choice - 1))]}"
            return 0
        fi
        
        echo "Invalid selection." >&2
    done
}
