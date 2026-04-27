{ pkgs, ... }:

{
  home.packages = with pkgs; [
    swayimg
    unstable.bluetui
    unstable.obs-studio
    wiremix
  ];
}
