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
        grim
        hypridle
        hyprlock
        hyprpicker
        mako
        nautilus 
        networkmanagerapplet
        ripgrep
        slurp
        stow
        sunsetr
        swayosd
        unstable.impala
        waybar
        wayfreeze
        wbg
        zellij
    ];
}
