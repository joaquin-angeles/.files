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
}
