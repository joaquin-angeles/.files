{ pkgs, ... }:

{
  # Rofi
  programs.rofi = {
    enable = true; # Installation
    plugins = [ pkgs.rofi-emoji ]; # Emoji picker
  };
}
