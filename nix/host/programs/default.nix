{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  config = {
    programs.dconf.enable = true; # GTK settings compatibility

    programs.river-classic = {
      enable = true;
      xwayland.enable = true;
      extraPackages = with pkgs; [
        dash
        swayidle
        wbg
        wideriver
        wlopm
      ];
    };
  }
  // mkIf config.features.gaming.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
