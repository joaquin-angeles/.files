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
    wl-clipboard
  ];
}
