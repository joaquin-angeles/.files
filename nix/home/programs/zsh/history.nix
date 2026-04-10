{ config, lib, ... }:

{
  # Base zsh configuration
  programs.zsh.history = {
    path = "${config.xdg.cacheHome}/zsh/history";
    size = 50000;
    save = 50000;
    share = true;
    ignoreSpace = true;
    extended = true;
    ignorePatterns = [
      "la *"
      "ll *"
      "lla *"
      "ls *"
      "lt *"
      "cd *"
      "pwd *"
    ];
    ignoreAllDups = true;
    saveNoDups = true;
    expireDuplicatesFirst = true;
  };

  programs.zsh.initContent = lib.mkAfter ''
    bindkey "^[[A" history-substring-search-up
    bindkey "^[[B" history-substring-search-down
    bindkey '^p' history-substring-search-up
    bindkey '^n' history-substring-search-down
  '';
}
