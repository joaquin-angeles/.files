{ pkgs, ... }:

{
  # Media tools
  home.packages = with pkgs; [
    imv
    mpv
    playerctl
    unstable.bluetui
    unstable.wiremix
  ];
}
