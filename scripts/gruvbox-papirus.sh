#!/usr/bin/env bash

set -euo pipefail  # Added -u (undefined vars) and -o pipefail (catch pipe failures)

ICONS_DIR="${HOME}/.local/share/icons"
PAPIRUS_REPO="${HOME}/.local/share/papirus-icon-theme"
GRUVBOX_REPO="${HOME}/.local/share/papirus-folders"

# Helper for consistent logging
log() { echo "[$(date +%T)] $*"; }
die() { echo "ERROR: $*" >&2; exit 1; }

# Verify git is available
command -v git &>/dev/null || die "git is not installed"

mkdir -p "$ICONS_DIR"

# Clone or update a git repo: clone_or_update <url> <dest> [extra clone flags]
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
    "https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git" \
    "$PAPIRUS_REPO" \
    --depth=1

clone_or_update \
    "https://github.com/xelser/gruvbox-papirus-folders.git" \
    "$GRUVBOX_REPO"

# Install/update Papirus themes (always sync to keep things clean)
log "Syncing Papirus icon themes..."
rm -rf "${ICONS_DIR}"/Papirus*
cp -rf "${PAPIRUS_REPO}"/Papirus* "${ICONS_DIR}/"

# Copy Gruvbox folder icons into Papirus theme
log "Installing Gruvbox folder icons..."
cp -r "${GRUVBOX_REPO}/src/"* "${ICONS_DIR}/Papirus/"

# Apply colour scheme
log "Applying Gruvbox Material Yellow..."
"${GRUVBOX_REPO}/papirus-folders" -C gruvbox-material-yellow --theme Papirus-Dark

log "Gruvbox Papirus Folders setup complete!"
