{ config, pkgs, ... }:

{
    imports = [
        ./programs/btop.nix              # System monitor
        ./programs/neovim.nix            # Text editor
        # ./programs/lutris.nix            # Game launcher
        ./programs/rofi.nix              # App launcher

        # Full configurations:
        ./config/alacritty/package.nix
        ./config/yazi/package.nix
        ./config/zellij/package.nix
        ./config/zsh/package.nix
    ];

    programs.home-manager.enable = true; # Home Manager
    programs.nh.enable = true;           # Nix helper
}
