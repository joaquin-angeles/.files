{ pkgs, ... }:

{
    imports = [
        ./config/theme.nix
        ./config/settings.nix
    ];

    programs.alacritty.enable = true; # Installation
}
