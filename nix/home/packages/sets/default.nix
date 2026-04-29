{ pkgs, ... }:

{
  imports = [
    ./flatpaks.nix
    ./scripts.nix
  ];

  home.packages = with pkgs; [
    # CLI / TUI
    cliphist
    lazygit
    nitch
    unstable.bluetui
    unstable.impala

    # Media tools
    swayimg
    wiremix

    # Archive tools
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
