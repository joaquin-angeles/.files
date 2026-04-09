{ ... }:

{
  # GTK settings
  programs.dconf.enable = true;

  # River
  programs.river-classic = {
    enable = true;
    xwayland.enable = true;
  };

  # Steam
  programs.steam = {
    enable = false;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
