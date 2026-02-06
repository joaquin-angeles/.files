{ ... }:

{
    programs.hyprland.enable = true; # Hyprland

    # Steam
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
    };

    programs.zsh.enable = true; # zsh
}
