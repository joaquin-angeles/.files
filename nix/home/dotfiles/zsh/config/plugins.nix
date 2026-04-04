{ pkgs, ... }:

{
  programs.zsh = {
    plugins = [
      # Prompt
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }

      # Which alias
      {
        name = "you-should-use";
        src = pkgs.zsh-you-should-use;
        file = "share/zsh-you-should-use/zsh-you-should-use.plugin.zsh";
      }

      # Improved tab completion
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }

      # History searching
      {
        name = "zsh-history-substring-search";
        src = pkgs.zsh-history-substring-search;
        file = "share/zsh-history-substring-search/zsh-history-substring-search.zsh";
      }

      # Colorize your shell
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-fast-syntax-highlighting;
        file = "share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh";
      }
    ];
  };
}
