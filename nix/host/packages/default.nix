{ pkgs, ... }:
{
  imports = [
    ./modules
  ];

  environment.systemPackages = with pkgs; [
    dash
    git
    gtk3
    gtk4
    qdl
    usbutils
    wl-clipboard
    zenity
  ];
}
