{ pkgs, ... }:

let
  # Install fonts
  fontPackages = with pkgs; [
    inter
    corefonts
    nerd-fonts.monaspace
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    source-serif
  ];

  # Build font symlinks
  flatFonts = pkgs.symlinkJoin {
    name = "flat-fonts";
    paths = fontPackages;
    postBuild = ''
      mkdir -p $out/share/fonts
      find $out -type f \( -name "*.ttf" -o -name "*.otf" -o -name "*.ttc" \) \
        -exec ln -sf {} $out/share/fonts/ \;
    '';
  };
in
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
        sansSerif = [ "Inter" ];
        serif = [ "Source Serif 4" ];
      };
    };
  };

  # Bootstrap fonts
  xdg.dataFile."fonts".source = "${flatFonts}/share/fonts";
}
