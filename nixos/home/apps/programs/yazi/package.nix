{ pkgs, ... }:

{
    imports = [
        ./settings.nix
        ./plugins.nix
        ./theme.nix
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
