{ pkgs, ... }:

{
  home.packages = with pkgs; [
    swayidle
    waybar
    wbg
    mako
    gammastep
    gtklock
    wayfreeze
    wideriver
    wlopm

    # Shell scripts for Wayland
    (import ./scripts/grimshot.nix { inherit pkgs; })
    (import ./scripts/mako-osd.nix { inherit pkgs; })
    (import ./scripts/wlpower.nix { inherit pkgs; })
  ];
}
