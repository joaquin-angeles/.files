{ ... }:

{
    imports = [
        ./themes/gruvbox_dark.nix
    ];

    programs.ghostty.settings = {
        background-opacity = 0.8;

        # Padding
        window-padding-x = 10;
        window-padding-y = 10;

        # TERM
        term = "xterm-256color";
    };
}
