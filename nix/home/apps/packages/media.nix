{ pkgs, ... }:

{
  # Media tools
  home.packages = with pkgs; [
    celluloid
    imv
    unstable.bluetui
    unstable.wiremix
  ];
}
