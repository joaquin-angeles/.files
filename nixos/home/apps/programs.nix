{ config, pkgs, ... }:

{
    imports = [
        "${config.home.homeDirectory}/.files/alacritty/package.nix"
        "${config.home.homeDirectory}/.files/waybar/package.nix"
        "${config.home.homeDirectory}/.files/yazi/package.nix"
        "${config.home.homeDirectory}/.files/zellij/package.nix"
        "${config.home.homeDirectory}/.files/zsh/package.nix"
    ];

    programs.home-manager.enable = true; # Home Manager
    programs.nh.enable = true;           # Nix helper
}
