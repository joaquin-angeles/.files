{ pkgs, ... }:

{
    imports = [
        ./packages/flatpaks.nix
        ./packages/fonts.nix
        ./packages/media.nix
        ./packages/scripts.nix
        ./packages/theme.nix
    ];

    # User packages
    home.packages = with pkgs; [
        cliphist
        file-roller
        hypridle
        hyprlock
        hyprpicker
        hyprshot
        mako
        nautilus 
        ripgrep
        stow
        sunsetr
        swayosd
        unstable.impala
        waybar
        wbg
        zellij
    ];
}
