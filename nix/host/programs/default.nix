{ pkgs, ... }:

{
  programs.dconf.enable = true; # GTK settings compatibility

  # Used wayland compositor
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

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
}
