{ pkgs, ... }:

{
  # GTK settings
  programs.dconf.enable = true;

  # River
  programs.river-classic = {
    enable = true;
    xwayland.enable = true;
  };

  # Thunar
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      xfce.thunar-archive-plugin
      xfce.thunar-volman
    ];
  };

  # Steam
  programs.steam = {
    # enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
