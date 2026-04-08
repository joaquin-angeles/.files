{ pkgs, lib, ... }:

{
  programs.zsh.initContent = lib.mkAfter ''
    source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

    # Syntax highlighting
    source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
    FAST_HIGHLIGHT[chroma-make]=0
    FAST_HIGHLIGHT[use_async]=1

    # Autosuggestions
    zsh-defer source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_USE_ASYNC=true
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  '';
}
