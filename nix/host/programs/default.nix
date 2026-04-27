{ pkgs, ... }:
{
  programs.dconf.enable = true;

  programs.river-classic = {
    enable = true;
    xwayland.enable = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      xfce.thunar-archive-plugin
      xfce.thunar-volman
    ];
  };
}
