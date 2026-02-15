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
        unstable.grimblast
        hypridle
        hyprlock
        hyprpicker
        mako
        nautilus 
        networkmanagerapplet
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
