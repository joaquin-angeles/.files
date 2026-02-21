#!/usr/bin/env bash

set -e  # Exit on error

KVANTUM_DIR="$HOME/.config/Kvantum"
GRUVBOX_REPO="/tmp/gruvbox-kvantum-themes"
THEME_NAME="Gruvbox-Dark-Blue"

# Create Kvantum config directory if it doesn't exist
mkdir -p "$KVANTUM_DIR"

# Clone the Gruvbox Kvantum themes repository
if [ -d "$GRUVBOX_REPO" ]; then
    echo "Updating Gruvbox Kvantum themes..."
    cd "$GRUVBOX_REPO" && git pull
else
    echo "Cloning Gruvbox Kvantum themes..."
    git clone --depth=1 https://github.com/sachnr/gruvbox-kvantum-themes.git "$GRUVBOX_REPO"
fi

# Copy the Blue theme to Kvantum config
if [ -d "$KVANTUM_DIR/$THEME_NAME" ]; then
    echo "Gruvbox-Dark-Blue is already installed."
else
    echo "Installing $THEME_NAME..."
    cp -r "$GRUVBOX_REPO/$THEME_NAME" "$KVANTUM_DIR/"
fi

# Set it as the active theme
echo "Applying $THEME_NAME..."
cat > "$KVANTUM_DIR/kvantum.kvconfig" <<EOF
[General]
theme=$THEME_NAME
EOF

echo "Gruvbox-Dark-Blue Kvantum theme setup complete!"
