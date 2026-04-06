{ config, lib, ... }:

{
  programs.zsh = {
    # zcompdump
    completionInit = ''
      autoload -Uz compinit
      if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
        compinit
      else
        compinit -C
      fi
    '';

    # .zshrc
    initContent = lib.mkMerge [
      # P10K instant prompt
      (lib.mkBefore ''
        # Speed up autosuggestions
        ZSH_AUTOSUGGEST_USE_ASYNC=true
        ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

        # P10K instant prompt
        if [[ -r "${config.xdg.cacheHome}/p10k-instant-prompt-${config.home.username}.zsh" ]]; then
          source "${config.xdg.cacheHome}/p10k-instant-prompt-${config.home.username}.zsh"
        fi
      '')

      # Functions and integrations
      (lib.mkAfter ''
        # P10K configuration
        [[ ! -f ${config.home.homeDirectory}/.p10k.zsh ]] || source ${config.home.homeDirectory}/.p10k.zsh
            
        # Faster syntax highlighting
        FAST_HIGHLIGHT[chroma-make]=0
        FAST_HIGHLIGHT[use_async]=1

        # Autosuggest fixes
        _autosuggest_config() {
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
          precmd_functions=("''${precmd_functions[@]:#_autosuggest_config}")
        }

        # Cursor and title configuration
        _set_cursor() { printf '\e[6 q'; }

        # Source pre-commands
        precmd_functions+=(_autosuggest_config _set_cursor)
      '')
    ];
  };
}
