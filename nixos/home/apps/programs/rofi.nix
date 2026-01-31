{ config, pkgs, ... }:

{
    # Rofi
    programs.rofi = {
        enable = true;
        plugins = [ pkgs.rofi-emoji ];
        font = "JetBrainsMono Nerd Font Mono 13.5";
        terminal = "${pkgs.alacritty}/bin/alacritty";
        theme = "gruvbox-dark-hard";
        extraConfig = {
            "kb-accept-entry" = "Return,KP_Enter";
            "kb-page-prev" = "Control+h";
            "kb-row-down" = "Down,Control+j";
            "kb-row-up" = "Up,Control+k";
            "kb-page-next" = "Control+l";
            "kb-remove-char-back" = "BackSpace,Shift+BackSpace";
            "kb-mode-complete" = "";
            "kb-remove-to-eol" = "";
            disable-history = true;
            case-sensitive = false;
            case-smart = true;
        };
    };
}
