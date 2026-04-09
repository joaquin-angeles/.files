{ config, pkgs, ... }:
{
  imports = [
    ./fonts.nix
    ./icons.nix
    ./gtk.nix
    ./qt.nix
  ];

  # Theme packages
  home.packages = with pkgs; [
    adw-gtk3
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    libnotify
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    nwg-look
  ];

  # Cursor theming
  home.pointerCursor = {
    gtk.enable = true;

    # Cursor theme
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;

    # XWayland cursor theming
    x11.enable = true;
    x11.defaultCursor = "Bibata-Modern-Ice";
  };

  # Vencord theme
  home.file = {
    # ".config/vesktop/themes/midnight-gruvbox.css".source "./discord.css";
    ".var/app/dev.vencord.Vesktop/config/vesktop/themes/midnight-gruvbox.css".source = ./discord.css;
  };

  # Wallpapers
  home.file."Pictures/Wallpapers".source = "${config.home.homeDirectory}/.files/walls";
}
