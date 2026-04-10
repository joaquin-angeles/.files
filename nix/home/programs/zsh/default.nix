{ config, ... }:

{
  imports = [
    ./init.nix
  ];

  # Base zsh configuration
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    defaultKeymap = "emacs"; # Emacs binds
  };
}
