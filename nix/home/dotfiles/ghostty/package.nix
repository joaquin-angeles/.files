{ ... }:

{
    imports = [
        ./config/settings.nix
        ./config/theme.nix
    ];

    programs.ghostty = {
        # Installation
        enable = true;
        systemd.enable = true;
    };
}
