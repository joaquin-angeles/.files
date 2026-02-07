{ ... }:

{
    imports = [
        ./config/modules.nix
        ./config/settings.nix
        ./config/theme.nix
    ];

    programs.waybar.enable = true;
}
