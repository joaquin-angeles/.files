{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gimp
    mpv
    obs-studio
    swayimg
    unstable.bluetui
    wiremix
  ];
}
