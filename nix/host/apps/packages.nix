{ pkgs, ... }:

{
  # System packages
  environment.systemPackages = with pkgs; [
    blueman
    brightnessctl
    gtk3
    gtk4
    home-manager
    polkit_gnome
    qdl
    usbutils
    wl-clipboard
    zenity
  ];
}
