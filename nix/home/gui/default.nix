{ config, pkgs, ... }:

{
  imports = [
    # GUI theming
    ./discord.nix
    ./fonts.nix
    ./gtk.nix
    ./icons.nix
    ./qt.nix
  ];

  # Theme packages
  home.packages = with pkgs; [
    adw-gtk3
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
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

  # Wallpapers
  home.file."Pictures/Wallpapers".source = "${config.home.homeDirectory}/.files/walls";
}
