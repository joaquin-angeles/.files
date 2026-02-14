{ inputs, pkgs, ... }:

{
    # Hyprland
    programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    };

    # Steam
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
    };

    programs.zsh.enable = true; # zsh
}
