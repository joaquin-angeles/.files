{ pkgs, ... }:
{
  imports = [
    # ./dev-tools.nix
    ./fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    dash
    git
    usbutils
  ];
}
