{ pkgs, ... }:
{
  imports = [
    ./dev-tools.nix
    ./fonts.nix
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
