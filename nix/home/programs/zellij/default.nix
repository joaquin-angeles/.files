{ ... }:

{
  # Configuration
  imports = [
    ./settings.nix
  ];

  # Installation
  programs.zellij = {
    enable = true;
    # enableZshIntegration = true;
  };
}
