{ config, pkgs, ... }:

{
    imports = [
        ./programs/btop.nix              # System monitor
        ./programs/neovim.nix            # Text editor
        ./programs/lutris.nix            # Game launcher
        ./programs/rofi.nix              # App launcher

        # Full configurations:
        ~/.files/alacritty/package.nix
        ~/.files/waybar/package.nix
        ~/.files/yazi/package.nix
        ~/.files/zellij/package.nix
        ~/.files/zsh/package.nix
    ];

    programs.home-manager.enable = true; # Home Manager
    programs.nh.enable = true;           # Nix helper
}
