{ config, pkgs, ... }:

{
  # Enable font configuration
  fonts.fontconfig.enable = true;

  # Font configurations
  fonts.fontconfig.defaultFonts = {
    emoji = [ "Blobmoji" ];
    monospace = [ "JetBrainsMono Nerd Font Mono" ];
    # monospace = [ "MesloLGM Nerd Font Mono" ];
    sansSerif = [ "Inter" ];
    serif = [ "Times New Roman" ];
  };
}
