{ ... }:

{
    imports = [
        ./themes/gruvbox_dark.nix
    ];

    programs.foot.settings = {
        main = {
            gamma-correct-blending = "no";
            pad = "10x10 center";
        };

        colors.alpha = "0.8";
        mouse.hide-when-typing = "yes";
        scrollback.indicator-position = "none";
    };
}
