{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.zsh = {
    # zcompdump
    completionInit = ''
      source ${pkgs.zsh-defer}/share/zsh-defer/zsh-defer.plugin.zsh
      autoload -Uz compinit
      zsh-defer compinit -
    '';

    # .zshrc
    initContent = lib.mkMerge [
      # P10K instant prompt
      (lib.mkBefore ''
        # P10K
        if [[ -r "${config.xdg.cacheHome}/p10k-instant-prompt-${config.home.username}.zsh" ]]; then
          source "${config.xdg.cacheHome}/p10k-instant-prompt-${config.home.username}.zsh"
        fi

        # Cursor and title configuration
        _set_cursor() { printf '\e[6 q'; }
        precmd_functions+=(_set_cursor)
      '')

      # Integrations and plugins
      (lib.mkAfter ''
        source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh

        # Autosuggestions
        zsh-defer source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        ZSH_AUTOSUGGEST_USE_ASYNC=true
        ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
        ZSH_AUTOSUGGEST_STRATEGY=(history completion)
        ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=(
          zle-\*
          beep
          set-local-history
          which-command
          yank
          yank-pop
          zle-isearch-exit
          zle-isearch-update
        )

        # Syntax highlighting
        source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
        FAST_HIGHLIGHT[chroma-make]=0
        FAST_HIGHLIGHT[use_async]=1

        # Custom prompt
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        export POWERLEVEL9K_CONFIG_FILE="${config.xdg.configHome}/zsh/.p10k.zsh"
        [[ -f "$POWERLEVEL9K_CONFIG_FILE" ]] && source "$POWERLEVEL9K_CONFIG_FILE"

        # lfcd () {
        #    cd "$(command lf -print-last-dir "$@")"
        # }
      '')
    ];
  };
}
