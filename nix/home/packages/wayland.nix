{ pkgs, ... }:

{
  home.packages = with pkgs; [
    grim
    ristate
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
