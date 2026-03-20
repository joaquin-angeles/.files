{ pkgs, ... }:

{
  imports = [
    ./config/theme.nix
    ./config/settings.nix
  ];

  programs.alacritty = {
    # Installation
    enable = true;
    package = pkgs.unstable.alacritty-graphics; # Image preview support in yazi
  };
}
