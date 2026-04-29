{ pkgs, ... }:
{
  programs.dconf.enable = true;

  programs.river-classic = {
    enable = true;
    xwayland.enable = false;
    extraPackages = with pkgs; [
      swayidle
      wbg
      wideriver
      wlopm
    ];
  };

  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = true;
  #   dedicatedServer.openFirewall = true;
  #   localNetworkGameTransfers.openFirewall = true;
  # };
}
