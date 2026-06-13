#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "$0")" && pwd)"
export PROJECT_ROOT

source "$PROJECT_ROOT/lib/common.sh"
source "$PROJECT_ROOT/lib/logging.sh"
source "$PROJECT_ROOT/lib/ui.sh"

get_scripts() {
    find "$PROJECT_ROOT/install" \
    -maxdepth 1 \
    -type f \
    -name "*.sh" \
    | sort
}

get_script_names() {
    local names=()
    
    while read -r script; do
        names+=("$(basename "$script")")
    done < <(get_scripts)
    
    printf '%s\n' "${names[@]}"
}

run_script() {
    local script="$1"
    
    step "Running $(basename "$script")"
    
    bash "$script"
    
    success "$(basename "$script") completed"
}

run_all() {
    while read -r script; do
        run_script "$script"
    done < <(get_scripts)
}

run_single() {
    local script="$1"
    
    run_script "$PROJECT_ROOT/install/$script"
}

run_from() {
    local start="$1"
    local running=false
    
    while read -r script; do
        local name
        name="$(basename "$script")"
        
        if [[ "$name" == "$start" ]]; then
            running=true
        fi
        
        if [[ "$running" == true ]]; then
            run_script "$script"
        fi
    done < <(get_scripts)
}

main() {
    step "PKZ Linux Installer"
    
    local action
    local selected
    local scripts
    
    action="$(
        select_option \
        "Available actions:" \
        "Run all scripts" \
        "Run from script" \
        "Run single script"
    )"
    
    case "$action" in
        "Run all scripts")
            run_all
        ;;
        
        "Run from script")
            mapfile -t scripts < <(get_script_names)
            
            selected="$(select_option "Available scripts:" "${scripts[@]}")"
            
            run_from "$selected"
        ;;
        
        "Run single script")
            mapfile -t scripts < <(get_script_names)
            
            selected="$(select_option "Available scripts:" "${scripts[@]}")"
            
            run_single "$selected"
        ;;
        
        *)
            error "Invalid option."
            exit 1
        ;;
    esac
    
    success "Installer finished."
}

main "$@"
