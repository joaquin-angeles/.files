{ pkgs, ... }:

{
    imports = [
        ./packages/development-tools.nix
        # ./packages/fonts.nix
    ];

    # System packages
    environment.systemPackages = with pkgs; [
        blueman
        brightnessctl
        gtk3
        gtk4
        home-manager
        networkmanagerapplet
        polkit_gnome
        usbutils
        wl-clipboard
        zenity
    ];
}
