{ pkgs, ... }:

{
  imports = [
    ./flatpaks.nix
    ./pwa.nix
    ./scripts.nix
  ];

  home.packages = with pkgs; [
    # CLI / TUI
    cliphist
    lazygit
    unstable.bluetui
    unstable.impala

    # Media tools
    swayimg
    wiremix

    # File management tools
    pcmanfm
    xarchiver
    p7zip
    unrar
    unzip
    zip

    # Wayland tools
    gammastep # Blue light filter
    gtklock # Screen locker
    wl-clipboard
  ];
}
