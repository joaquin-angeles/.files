#!/usr/bin/env dash

set -e

ICONS_DIR="${HOME}/.local/share/icons"
PAPIRUS_REPO="${HOME}/.local/share/papirus-icon-theme"
GRUVBOX_REPO="${HOME}/.local/share/papirus-folders"

log() { echo "[$(date +%T)] $*"; }
die() { echo "ERROR: $*" >&2; exit 1; }

command -v git >/dev/null 2>&1 || die "git is not installed"

mkdir -p "$ICONS_DIR"

clone_or_update() {
    url="$1"
    dest="$2"
    shift 2
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

log "Checking Papirus icon theme symlinks..."
for src in "${PAPIRUS_REPO}"/Papirus*/; do
    dest="${ICONS_DIR}/$(basename "$src")"
    if [ ! -L "$dest" ]; then
        log "Linking $(basename "$src")..."
        ln -sfn "$src" "$dest"
    else
        log "Symlink already exists for $(basename "$src"), skipping..."
    fi
done

log "Installing Gruvbox folder icons..."
cp -r "${GRUVBOX_REPO}/src/"* "${ICONS_DIR}/Papirus/"

log "Applying Gruvbox Material Yellow..."
"${GRUVBOX_REPO}/papirus-folders" -C gruvbox-material-yellow --theme Papirus-Dark

log "Gruvbox Papirus Folders setup complete!"
