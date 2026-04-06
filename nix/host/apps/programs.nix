{ pkgs, ... }:

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
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # File manager
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  programs.zsh.enable = true; # zsh
}
