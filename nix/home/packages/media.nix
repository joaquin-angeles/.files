{ pkgs, ... }:

{
  home.packages = with pkgs; [
    unstable.bluetui
    mpv
    playerctl
    swayimg
    wiremix
  ];
}
