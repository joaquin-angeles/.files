{ config, pkgs, ... }:

{
    imports = [
        ./programs/alacritty/package.nix # Terminal
        ./programs/btop.nix              # System monitor
        ./programs/neovim.nix            # Text editor
        ./programs/lutris.nix            # Game launcher
        ./programs/rofi.nix              # App launcher
        ./programs/yazi/package.nix      # Terminal file manager
        ./programs/zsh/package.nix       # Shell configuration
    ];

    programs.home-manager.enable = true; # Home Manager
    programs.nh.enable = true;           # Nix helper
}
