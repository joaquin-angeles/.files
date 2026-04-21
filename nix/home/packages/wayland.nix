{ pkgs, ... }:

{
  home.packages = with pkgs; [
    grim
    slurp
    swayidle
    waybar
    wbg
    wlr-randr
    mako
    gammastep
    gtklock
    wayfreeze
    wideriver
    wlopm
  ];
}
