{ pkgs, ... }:

{
  imports = [
    ./flatpaks.nix
    ./scripts.nix
    ./wayland.nix
  ];

  home.packages = with pkgs; [
    # CLI / TUI
    cliphist
    lazygit
    nitch
    unstable.impala

    # Media tools
    swayimg
    unstable.bluetui
    # unstable.obs-studio
    wiremix

    file-roller # Archive manager
  ];
}
