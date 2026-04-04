#!/usr/bin/env sh

set -e

KVANTUM_DIR="${HOME}/.config/Kvantum"
GRUVBOX_REPO="${HOME}/.local/share/gruvbox-kvantum"
THEME_NAME="Gruvbox-Dark-Blue"

log() { echo "[$(date +%T)] $*"; }
die() { echo "ERROR: $*" >&2; exit 1; }

command -v git >/dev/null 2>&1 || die "git is not installed"

mkdir -p "$KVANTUM_DIR"

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
    "https://github.com/sachnr/gruvbox-kvantum-themes.git" \
    "$GRUVBOX_REPO" \
    --depth=1

THEME_DEST="${KVANTUM_DIR}/${THEME_NAME}"
if [ ! -L "$THEME_DEST" ] || [ ! -e "$THEME_DEST" ]; then
    log "Linking $THEME_NAME..."
    ln -sfn "${GRUVBOX_REPO}/${THEME_NAME}" "$KVANTUM_DIR/"
else
    log "Symlink already exists for $THEME_NAME, skipping..."
fi

log "Applying $THEME_NAME..."
cat > "${KVANTUM_DIR}/kvantum.kvconfig" <<EOF
[General]
theme=$THEME_NAME
EOF

log "Gruvbox-Dark-Blue Kvantum theme setup complete!"
