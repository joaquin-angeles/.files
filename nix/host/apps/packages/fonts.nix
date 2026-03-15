{pkgs, ...}: {
  # Font configurations
  fonts = {
    enableDefaultPackages = true;
    fontconfig.enable = true;
    fontconfig.antialias = true; # Enable antialiasing
    fontconfig.hinting.enable = true;
    fontconfig.hinting.style = "medium"; # Configure antialiasing
    fontconfig.subpixel.rgba = "rgb";
    fontconfig.subpixel.lcdfilter = "default";
    fontDir.enable = true; # Directory correction

    # Packages
    packages = with pkgs; [
      corefonts
      inter
      nerd-fonts.jetbrains-mono
      nerd-fonts.meslo-lg
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji-blob-bin
      rubik
    ];
  };
}
