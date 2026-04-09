{ config, ... }:

{
  imports = [
    ./aliases.nix # Shell aliases
    ./init.nix # Extra shell config
    ./integrations.nix # Shell integrations
    ./history.nix # History config
  ];

  # Base zsh configuration
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    defaultKeymap = "emacs"; # Emacs binds
  };
}
