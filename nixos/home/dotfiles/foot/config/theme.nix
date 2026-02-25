{ ... }:

{
    imports = [
        ./themes/gruvbox_dark.nix
    ];

    programs.foot.settings = {
        main.pad = "10x10 center";
        mouse.hide-when-typing = true;
        scrollback.indicator-position = "none";
    };
}
