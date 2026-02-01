{ config, pkgs, ... }:

{
    # Enable font configuration
    fonts.fontconfig.enable = true;

    # Font packages
    home.packages = with pkgs; [
        corefonts
        inter
        nerd-fonts.jetbrains-mono
        nerd-fonts.meslo-lg
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji-blob-bin
    ];

    # Font configurations
    fonts.fontconfig.defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "JetBrainsMono Nerd Font Mono" ];
        # monospace = [ "MesloLGM Nerd Font Mono" ];
        sansSerif = [ "Inter" ];
        serif = [ "Times New Roman" ];
    };
}
