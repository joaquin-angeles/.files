{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./gui/fonts.nix
    ./gui/icons.nix
    ./gui/gtk.nix
    ./gui/qt.nix
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
    # XWayland cursor theming
    x11.enable = true;
    x11.defaultCursor = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors; # Cursor package
    name = "Bibata-Modern-Ice"; # Cursor theme
    size = 24;
  };

  # Vencord theme
  home.file = {
    # ".config/vesktop/themes/midnight-gruvbox.css".source "./vencord/midnight-gruvbox.css";
    ".var/app/dev.vencord.Vesktop/config/vesktop/themes/midnight-gruvbox.css".source =
      ./vencord/midnight-gruvbox.css;
  };

  # Wallpapers
  home.file."Pictures/Wallpapers".source = "${config.home.homeDirectory}/.files/wallpapers";
}
