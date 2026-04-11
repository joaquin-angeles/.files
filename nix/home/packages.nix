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
    gtklock
    impala
    lazygit
    mako
    mpv
    nitch
    playerctl
    ripgrep
    slurp
    sunsetr
    swayidle
    swayimg
    unstable.bluetui
    unstable.wiremix
    waybar
    wayfreeze
    wbg
    wideriver
    wlopm
    wlr-randr
    zellij
  ];
}
