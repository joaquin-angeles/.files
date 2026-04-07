{ pkgs, ... }:

{
  imports = [
    ./packages/flatpaks.nix
    ./packages/pcmanfm.nix
    ./packages/scripts.nix
  ];

  # User packages
  home.packages = with pkgs; [
    cliphist
    grim
    hyprpicker
    impala
    imv
    lazygit
    mako
    mpv
    nitch
    playerctl
    ripgrep
    slurp
    sunsetr
    swayidle
    unstable.bluetui
    unstable.wiremix
    waybar
    wbg
    wideriver
    wlr-randr
    zellij
  ];
}
