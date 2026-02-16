{ pkgs, lib, ... }:

{
    home.activation.gruvboxPapirus = lib.hm.dag.entryAfter ["writeBoundary"] ''
        ICONS_DIR="$HOME/.local/share/icons"
        PAPIRUS_REPO="$ICONS_DIR/papirus-icon-theme"
        GRUVBOX_REPO="$HOME/.bin/papirus-folders"

        # Create directories if they don't exist
        mkdir -p "$ICONS_DIR"
        mkdir -p "$HOME/.bin"

        # Clone or update Papirus icon theme repository
        if [ -d "$PAPIRUS_REPO" ]; then
            $DRY_RUN_CMD echo "Updating Papirus icon theme..."
            $DRY_RUN_CMD cd "$PAPIRUS_REPO" && ${pkgs.git}/bin/git pull
        else
            $DRY_RUN_CMD echo "Cloning Papirus icon theme..."
            $DRY_RUN_CMD ${pkgs.git}/bin/git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git "$PAPIRUS_REPO"
        fi

        # Copy Papirus themes to icons directory
        $DRY_RUN_CMD echo "Installing Papirus icon themes..."
        $DRY_RUN_CMD cp -rf "$PAPIRUS_REPO"/Papirus* "$ICONS_DIR/"

        # Clone or update Gruvbox Papirus Folders repository
        if [ -d "$GRUVBOX_REPO" ]; then
            $DRY_RUN_CMD echo "Updating Gruvbox Papirus Folders..."
            $DRY_RUN_CMD cd "$GRUVBOX_REPO" && ${pkgs.git}/bin/git pull
        else
            $DRY_RUN_CMD echo "Cloning Gruvbox Papirus Folders..."
            $DRY_RUN_CMD ${pkgs.git}/bin/git clone https://github.com/xelser/gruvbox-papirus-folders.git "$GRUVBOX_REPO"
        fi

        # Copy Gruvbox folder icons to Papirus themes
        $DRY_RUN_CMD echo "Installing Gruvbox folder icons..."
        $DRY_RUN_CMD cp -r "$GRUVBOX_REPO"/src/* "$ICONS_DIR/Papirus/"

        # Apply color scheme using the gruvbox-papirus-folders script
        $DRY_RUN_CMD echo "Applying Gruvbox Material Yellow..."
        $DRY_RUN_CMD "$GRUVBOX_REPO/papirus-folders" -C gruvbox-material-yellow --theme Papirus-Dark

        $DRY_RUN_CMD echo "Gruvbox Papirus Folders setup complete!"
    '';

    # Set icon theme
    gtk.iconTheme = {
        name = "Papirus-Dark";
        package = null;  # Use local installation instead
    };
}
