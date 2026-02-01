{ inputs, config, pkgs,  ... }:

{

    # Theme packages
    home.packages = with pkgs; [
        adw-gtk3
        kdePackages.qt6ct
        kdePackages.qtstyleplugin-kvantum
        lazygit
        libnotify
        libsForQt5.qt5ct
        libsForQt5.qtstyleplugin-kvantum
        nwg-look
    ];
     
    # Cursor theming
    home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true; # XWayland cursor theming
        package = pkgs.bibata-cursors; # Cursor package
        name = "Bibata-Modern-Ice"; # Cursor theme
        size = 24;
    };

    # Vencord theme
    # home.file.".config/vesktop/themes/midnight-gruvbox.css".source = ../../../vencord/themes/midnight-gruvbox.css; # Native theming
    home.file.".var/app/dev.vencord.Vesktop/config/vesktop/themes/midnight-gruvbox.css".source = ../../../../vencord/themes/midnight-gruvbox.css;

    # Wallpaper
    home.file."Pictures/backgrounds".source = ../../../../backgrounds;

    # GTK theming
    gtk = {
        enable = true;
        theme = {
            name = "Gruvbox-Dark";
            package = pkgs.gruvbox-gtk-theme;
        };

        iconTheme = {
            name = "Gruvbox-Plus-Dark";
            package = pkgs.gruvbox-plus-icons;
        };

        # Enable dark theme
        gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
        gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
    };

    # GTK4 dark theme
    dconf = {
        enable = true;
        settings = {
            "org/gnome/desktop/interface" = {
                "color-scheme" = "prefer-dark";
            };
        };
    };

    # Qt theming
    qt = {
        enable = true;
        platformTheme.name = "qtct";
        style = {
            name = "kvantum-dark";
        };
    };

    # Overwritten config files
    xdg.configFile."gtk-4.0/settings.ini".force = true;
    xdg.configFile."gtk-4.0/assets".source = "${pkgs.gruvbox-gtk-theme}/share/themes/Gruvbox-Dark/gtk-4.0/assets";
    xdg.configFile."gtk-4.0/gtk.css".source = "${pkgs.gruvbox-gtk-theme}/share/themes/Gruvbox-Dark/gtk-4.0/gtk.css";
    xdg.configFile."gtk-4.0/gtk-dark.css".source = "${pkgs.gruvbox-gtk-theme}/share/themes/Gruvbox-Dark/gtk-4.0/gtk-dark.css";
}
