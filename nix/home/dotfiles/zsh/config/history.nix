{ config, lib, ... }:

{
  # Base zsh configuration
  programs.zsh.history = {
    path = "${config.xdg.cacheHome}/zsh/history";
    size = 5000; # HISTSIZE
    save = 5000;
    share = true;
    ignoreSpace = true; # Ignore commands that start with a space
    extended = true;
    ignorePatterns = [
      "ls *"
      "cd *"
      "pwd *"
    ]; # Ignore frequent/redundant commands

    # Ignore duplicate commands
    ignoreDups = true;
    ignoreAllDups = true;
    saveNoDups = true;
    expireDuplicatesFirst = true;
  };

  programs.zsh.initContent = lib.mkAfter ''
    bindkey '^n' history-substring-search-down
    bindkey '^p' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    bindkey '^[[A' history-substring-search-up
  '';
}
