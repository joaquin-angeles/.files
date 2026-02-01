{ config, pkgs, ... }:

{
    services.flatpak = {
        enable = true;

        # Repositories
        remotes = [
            { name = "flathub"; location = "https://dl.flathub.org/repo/flathub.flatpakrepo"; }  # Explicitly set
            { name = "flathub-beta"; location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo"; } # Unstable branch
        ];

        # Installed flatpaks
        packages = [
            "app.zen_browser.zen"         # Default browser
            # "com.github.tchx84.Flatseal"
            "com.obsproject.Studio"       # Screen recording software
            # "com.usebottles.bottles"    # Windows applications
            "com.vysp3r.ProtonPlus"       # Games compatibility tool
            "com.spotify.Client"          # Music streaming
            "dev.vencord.Vesktop"         # Discord
            "io.mrarm.mcpelauncher"       # Minecraft: Bedrock Edition
            "org.chromium.Chromium"       # Progressive web apps
            "org.libreoffice.LibreOffice" # Office suite
            "org.gimp.GIMP"               # Photo editing software
            "org.vinegarhq.Sober"         # Roblox
        ];

        uninstallUnmanaged = true; # True declarative
        update.onActivation = false; # Update every rebuild

        # Scheduled updating
        update.auto = {
            enable = true;
            onCalendar = "weekly";
        };
    };

    # Settings
    services.flatpak.overrides = {

        # Global options
        global = {

            # Environmental variables
            Environment = {
                "GTK_THEME" = "Gruvbox-Dark"; # Set GTK theme
                "GTK_APPLICATION_PREFER_DARK_THEME" = "1"; # Enable dark mode
            };

            # Device access
            Context = {
                devices = [ "dri" ]; # GPU access
            };

            # File access
            Context.filesystems = [
                "/nix/store:ro"
                "~/.local/share/icons" # Access to themes
                "~/.local/share/applications" # Access to themes
                "~/.local/share/fonts:ro" # Access to fonts
                "~/.local/share/themes:ro" # Access to themes

                # GTK Theming and icon access
                "xdg-config/gtk-3.0:ro"
                "xdg-config/gtk-4.0:ro"
                "xdg-data/themes:ro"
                "xdg-data/icons:ro"
            ];
        };

        # Libadwaita themes for badly themed packages
        "app.zen_browser.zen" = {
            Environment = {
                "GTK_THEME" = "adw-gtk3-dark";
            };
        };

        "com.github.tchx84.Flatseal" = {
            Environment = {
                "GTK_THEME" = "adw-gtk3-dark:dark";
            };
            Context.filesystems = [
                "!xdg-config/gtk-3.0"
                "!xdg-config/gtk-4.0"
            ];
        };

        # Vesktop config
        "dev.vencord.Vesktop" = {
            Context.filesystems = [
                "home:ro"
            ];
        };
    };

    # Font correction
    home.activation.flatpakFonts = config.lib.dag.entryAfter ["writeBoundary"] ''
        $DRY_RUN_CMD mkdir -p $HOME/.local/share/fonts

        # Define the font packages to link
        FONT_PKGS=(
            "${pkgs.corefonts}"
            "${pkgs.inter}"
            "${pkgs.nerd-fonts.jetbrains-mono}"
            "${pkgs.nerd-fonts.meslo-lg}"
            "${pkgs.noto-fonts}"
            "${pkgs.noto-fonts-cjk-sans}"
            "${pkgs.noto-fonts-emoji-blob-bin}"
        )

        for pkg in "''${FONT_PKGS[@]}"; do
            # Most font packages put fonts in share/fonts/{truetype,opentype,woff,woff2,...}
            for dir in "$pkg/share/fonts/"*; do
                if [ -d "$dir" ]; then
                    $DRY_RUN_CMD find "$dir" -type f \
                        -exec ln -sfn {} "$HOME/.local/share/fonts/" \;
                fi
            done

            if [ -d "$pkg/share/fonts" ]; then
                $DRY_RUN_CMD find "$pkg/share/fonts" -maxdepth 1 -type f \
                    -exec ln -sfn {} "$HOME/.local/share/fonts/" \;
            fi
        done

        # Refresh font cache
        $DRY_RUN_CMD fc-cache -fv || true
    '';

    # Flatpak GTK theme correction
    home.activation.flatpakGtkThemes = config.lib.dag.entryAfter ["writeBoundary"] ''
        $DRY_RUN_CMD mkdir -p $HOME/.local/share/themes

        # Define the theme packages to link
        THEME_PKGS=("${pkgs.gruvbox-gtk-theme}" "${pkgs.adw-gtk3}")

        for pkg in "''${THEME_PKGS[@]}"; do
            if [ -d "$pkg/share/themes" ]; then
                for theme in "$pkg/share/themes/"*; do
                    $DRY_RUN_CMD ln -sfn "$theme" "$HOME/.local/share/themes/"
                done
            fi
        done
    '';
}
