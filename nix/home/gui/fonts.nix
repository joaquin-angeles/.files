{ ... }:

{
  fonts = {
    fontconfig = {
      enable = true; # Enable font configuration

      # Font configuration
      antialiasing = true; # Improve font rendering
      hinting = "medium"; # Subtle font hinting for clarity
      subpixelRendering = "rgb";

      # Set default fonts
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "MonaspiceNe Nerd Font Mono" ];
        sansSerif = [
          "Inter"
          "Noto Sans CJK SC"
          "Noto Color Emoji"
        ];
        serif = [ "Source Serif 4" ];
      };
    };
  };
}
