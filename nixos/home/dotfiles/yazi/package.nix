{ pkgs, ... }:

{
    imports = [
        ./config/settings.nix
        ./config/plugins.nix
        ./config/theme.nix
    ];

    programs.yazi = {

        # Prerequisites
        enable = true;
        enableZshIntegration = true; # Shell integration

        # Previewers
        extraPackages = with pkgs; [
            ffmpegthumbnailer
            ueberzugpp
            file
            poppler
        ];
    };
}
