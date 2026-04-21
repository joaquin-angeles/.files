{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brightnessctl
    dash
    git
    gtk3
    gtk4
    polkit_gnome
    qdl
    usbutils
    wl-clipboard
    zenity
  ];
}
