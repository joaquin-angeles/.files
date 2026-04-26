{ pkgs, ... }:
{
  imports = [
    ./modules/dev-tools.nix
    ./modules/fonts.nix
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
