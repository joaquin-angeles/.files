{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mpv
    obs-studio
    swayimg
    unstable.bluetui
    wiremix
  ];
}
