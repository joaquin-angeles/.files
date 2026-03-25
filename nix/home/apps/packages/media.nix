{ pkgs, ... }:

{
  # Media tools
  home.packages = with pkgs; [
    celluloid
    imv
    playerctl
    unstable.bluetui
    unstable.wiremix
  ];
}
