{ ... }:

{
  # Configuration
  imports = [
    ./config.nix
  ];

  # Installation
  programs.zellij.enable = true;
}
