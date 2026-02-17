{ config, pkgs, ... }:

{
    imports = [
        ./programs/btop.nix              # System monitor
        ./programs/neovim.nix            # Text editor
        # ./programs/lutris.nix            # Game launcher
        ./programs/rofi.nix              # App launcher

        # Full configurations:
        /home/joaquin/.files/alacritty/package.nix
        /home/joaquin/.files/waybar/package.nix
        /home/joaquin/.files/yazi/package.nix
        /home/joaquin/.files/zellij/package.nix
        /home/joaquin/.files/zsh/package.nix
    ];

    programs.home-manager.enable = true; # Home Manager
    programs.nh.enable = true;           # Nix helper
}
