{ config, ... }:

{
  imports = [
    ./config/aliases.nix # Shell aliases
    ./config/init.nix # Extra shell config
    ./config/integrations.nix # Shell integrations
    ./config/history.nix # History config
  ];

  # Base zsh configuration
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    defaultKeymap = "emacs"; # Emacs binds
  };
}
