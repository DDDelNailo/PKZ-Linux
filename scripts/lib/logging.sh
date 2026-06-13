info() {
    echo "[INFO] $*"
}

success() {
    echo "[ OK ] $*"
}

warn() {
    echo "[WARN] $*"
}

error() {
    echo "[FAIL] $*" >&2
}

step() {
    echo
    echo "==> $*"
}

loading() {
    local message="$1"
    
    echo -n "$message..."
}

loading_done() {
    echo " done."
}
