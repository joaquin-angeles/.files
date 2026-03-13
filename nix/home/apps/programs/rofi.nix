{ pkgs, ... }:

{
    # Rofi
    programs.rofi = {
        enable = true; # Installation
        plugins = [ pkgs.rofi-emoji ]; # Emoji picker
        font = "JetBrainsMono Nerd Font Mono 13.5"; # Font
        terminal = "${pkgs.alacritty}/bin/alacritty"; # $TERM
        theme = "gruvbox-dark-hard"; # Theme setting
        extraConfig = {

            # Bindings
            "kb-accept-entry" = "Return,KP_Enter";
            "kb-row-left" = "Control+h";
            "kb-row-down" = "Down,Control+j";
            "kb-row-up" = "Up,Control+k";
            "kb-row-right" = "Control+l";
            "kb-remove-char-back" = "BackSpace,Shift+BackSpace";

            # Unbindings
            "kb-mode-complete" = "";
            "kb-remove-to-eol" = "";

            # Search settings
            disable-history = true;
            case-sensitive = false;
            case-smart = true;
        };
    };
}
