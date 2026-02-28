#!/usr/bin/env bash

set -euo pipefail

KVANTUM_DIR="${HOME}/.config/Kvantum"
GRUVBOX_REPO="${HOME}/.local/share/gruvbox-kvantum"
THEME_NAME="Gruvbox-Dark-Blue"

log() { echo "[$(date +%T)] $*"; }
die() { echo "ERROR: $*" >&2; exit 1; }

command -v git &>/dev/null || die "git is not installed"

mkdir -p "$KVANTUM_DIR"

clone_or_update() {
    local url="$1" dest="$2"; shift 2
    if [ -d "$dest/.git" ]; then
        log "Updating $(basename "$dest")..."
        git -C "$dest" pull --ff-only || die "Failed to update $dest"
    else
        log "Cloning $(basename "$dest")..."
        git clone "$@" "$url" "$dest" || die "Failed to clone $url"
    fi
}

clone_or_update \
    "https://github.com/sachnr/gruvbox-kvantum-themes.git" \
    "$GRUVBOX_REPO" \
    --depth=1

# Always sync theme directory to pick up updates
log "Installing $THEME_NAME..."
ln -sfn "${GRUVBOX_REPO}/${THEME_NAME}" "$KVANTUM_DIR/"

# Set it as the active theme
log "Applying $THEME_NAME..."
cat > "${KVANTUM_DIR}/kvantum.kvconfig" <<EOF
[General]
theme=$THEME_NAME
EOF

log "Gruvbox-Dark-Blue Kvantum theme setup complete!"
