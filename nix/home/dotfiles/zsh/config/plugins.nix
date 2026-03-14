{ pkgs, ... }:

{
    programs.zsh = {
        syntaxHighlighting.enable = true; # Colorize your shell
        autosuggestion.enable = true;     # Autosuggestions
        enableCompletion = true;          # Auto-completions

        # Extra plugins
        plugins = [
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
        ];
    };
}
