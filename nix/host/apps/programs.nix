{ pkgs, ... }:
{
  # Hyprland
  programs.hyprland = {
    enable = true;
    package = pkgs.unstable.hyprland;
  };

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.zsh.enable = true; # zsh
}
