{ pkgs, ... }:

{
  programs.zsh = {
    syntaxHighlighting.enable = true; # Colorize your shell
    autosuggestion.enable = true; # Autosuggestions
    enableCompletion = true; # Auto-completions

    # Extra plugins
    plugins = [
      # History searching
      {
        name = "zsh-history-substring-search";
        src = pkgs.zsh-history-substring-search;
        file = "share/zsh-history-substring-search/zsh-history-substring-search.zsh";
      }

      # Prompt
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }

      # Improved tab completion
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }

      # Which alias
      {
        name = "you-should-use";
        src = pkgs.zsh-you-should-use;
        file = "share/zsh-you-should-use/zsh-you-should-use.plugin.zsh";
      }
    ];
  };
}
