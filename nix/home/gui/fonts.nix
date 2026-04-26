{ ... }:

{
  # Enable font configuration
  fonts.fontconfig.enable = true;

  # Font configurations
  fonts.fontconfig.defaultFonts = {
    emoji = [ "Noto Color Emoji" ];
    monospace = [ "MonaspiceNe Nerd Font Mono" ];
    sansSerif = [ "Inter" ];
    serif = [ "Source Serif 4" ];
  };
}
