{ config, pkgs, ... }:

{
    imports = [
        ./programs/fastfetch.nix
        ./programs/btop.nix              # System monitor
        ./programs/neovim.nix            # Text editor
        # ./programs/lutris.nix            # Game launcher
        ./programs/rofi.nix              # App launcher
    ];

    programs.home-manager.enable = true; # Home Manager
    programs.nh.enable = true;           # Nix helper
}
