{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = true;
        style = "medium";
      };
      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };
    };
    packages = with pkgs; [
      corefonts
      inter
      nerd-fonts.monaspace
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      source-serif
    ];
  };
}
