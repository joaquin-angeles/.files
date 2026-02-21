#!/usr/bin/env bash

set -e  # Exit on error

ICONS_DIR="$HOME/.local/share/icons"
PAPIRUS_REPO="/tmp/papirus-icon-theme"
GRUVBOX_REPO="$HOME/.local/share/papirus-folders"

# Create directories if they don't exist
mkdir -p "$ICONS_DIR"
mkdir -p "$HOME/.bin"

# Clone or update Papirus icon theme repository
if [ -d "$PAPIRUS_REPO" ]; then
    echo "The Papirus icon theme is already installed."
else
    echo "Cloning Papirus icon theme..."
    git clone --depth=1 https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git "$PAPIRUS_REPO"
fi

# Copy Papirus themes to icons directory
if [ -d "$ICONS_DIR/Papirus" ]; then
    echo "The Papirus icon theme is already installed"
else
    echo "Installing Papirus icon themes..."
    cp -rf "$PAPIRUS_REPO/Papirus*" "$ICONS_DIR/"
fi

# Clone or update Gruvbox Papirus Folders repository
if [ -d "$GRUVBOX_REPO" ]; then
    echo "Updating Gruvbox Papirus Folders..."
    cd "$GRUVBOX_REPO" && git pull
else
    echo "Cloning Gruvbox Papirus Folders..."
    git clone https://github.com/xelser/gruvbox-papirus-folders.git "$GRUVBOX_REPO"
fi

# Copy Gruvbox folder icons to Papirus themes
echo "Installing Gruvbox folder icons..."
cp -r "$GRUVBOX_REPO/src/"* "$ICONS_DIR/Papirus/"

# Apply color scheme using the gruvbox-papirus-folders script
echo "Applying Gruvbox Material Yellow..."
"$GRUVBOX_REPO/papirus-folders" -C gruvbox-material-yellow --theme Papirus-Dark

echo "Gruvbox Papirus Folders setup complete!"
