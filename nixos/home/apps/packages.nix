{ config, pkgs, ... }:

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
        lazygit
        mako
        nautilus 
        ripgrep
        slurp
        stow
        sunsetr
        swayosd
        waybar
        wayfreeze
        wbg
        zellij
    ];

    # Facebook Messenger
    xdg.desktopEntries.messenger = {
        name = "Messenger";
        exec = "flatpak run org.chromium.Chromium --app=https://www.facebook.com/messages/";
        icon = "fbmessenger";
        terminal = false;
        settings = {
            X-Flatpak-Part-Of = "org.chromium.Chromium";
            TryExec = "${config.home.homeDirectory}/.local/share/flatpak/exports/bin/org.chromium.Chromium";
        };
    };
}
