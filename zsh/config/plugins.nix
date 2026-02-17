{ pkgs, ... }:

{
    programs.zsh = {
        syntaxHighlighting.enable = true; # Colorize your shell
        autosuggestion.enable = true;     # Autosuggestions
        enableCompletion = true;          # Auto-completions
    };

    # Extra plugins
    home.packages = with pkgs; [
        zsh-powerlevel10k # Fast prompt
    ];
}
