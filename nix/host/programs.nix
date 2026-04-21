{ ... }:
{
  programs.dconf.enable = true;
  programs.river-classic = {
    enable = true;
    xwayland.enable = true;
  };
  programs.steam = {
    # enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
