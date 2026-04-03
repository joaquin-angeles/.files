{ pkgs, ... }:

{
  # River
  programs.river-classic.enable = true;

  # Steam
  programs.steam = {
    enable = true;
    package = pkgs.unstable.steam;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.zsh.enable = true; # zsh
}
