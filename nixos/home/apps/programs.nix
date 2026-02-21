{ config, pkgs, ... }:

{
    imports = [
        # Full configurations:
        ./programs/alacritty/package.nix
        ./programs/waybar/package.nix
        ./programs/yazi/package.nix
        ./programs/zellij/package.nix
        ./programs/zsh/package.nix

        ./programs/fastfetch.nix
        ./programs/btop.nix              # System monitor
        ./programs/neovim.nix            # Text editor
        # ./programs/lutris.nix            # Game launcher
        ./programs/rofi.nix              # App launcher
    ];

    programs.home-manager.enable = true; # Home Manager
    programs.nh.enable = true;           # Nix helper
}
