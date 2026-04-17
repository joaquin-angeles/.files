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
    gtklock
    wayfreeze
    wideriver
    wlopm
    sunsetr
  ];
}
