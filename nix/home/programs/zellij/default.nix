{ ... }:

{
  # Configuration
  imports = [
    ./keybinds.nix
    ./settings.nix
  ];

  # Installation
  programs.zellij.enable = true;
}
