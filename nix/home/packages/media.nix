{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mpv
    obs-studio
    playerctl
    swayimg
    unstable.bluetui
    wiremix
  ];
}
