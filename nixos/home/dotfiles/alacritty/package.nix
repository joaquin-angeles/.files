{ pkgs, ... }:

{
    imports = [
        ./config/theme.nix
        ./config/settings.nix
    ];

    programs.alacritty = {
        # Install
        enable = true;
        package = pkgs.unstable.alacritty-graphics;
    };
}
