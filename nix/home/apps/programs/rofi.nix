{ pkgs, ... }:

{
  # Rofi
  programs.rofi = {
    enable = true; # Installation
    plugins = [ pkgs.rofi-emoji ]; # Emoji picker
    font = "monospace 13.5"; # Font
    terminal = "${pkgs.alacritty}/bin/alacritty"; # $TERM
    theme = "gruvbox-dark-hard"; # Theme setting
    extraConfig = {
      # Bindings
      "kb-row-down" = "Down,Control+n";
      "kb-row-up" = "Up,Control+p";

      # Search settings
      disable-history = true;
      case-sensitive = false;
      case-smart = true;
    };
  };
}
