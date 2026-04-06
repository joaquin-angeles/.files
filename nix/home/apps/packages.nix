{ config, pkgs, ... }:

{
  imports = [
    ./packages/flatpaks.nix
    ./packages/media.nix
    ./packages/scripts.nix
  ];

  # User packages
  home.packages = with pkgs; [
    cliphist
    file-roller
    grim
    hyprpicker
    impala
    lazygit
    mako
    nitch
    ripgrep
    slurp
    sunsetr
    swayidle
    waybar
    wbg
    wideriver
    wlr-randr
    zellij
  ];
}
