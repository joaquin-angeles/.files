{ config, lib, ... }:

{
  programs.zsh = {
    # zcompdump
    completionInit = ''
      mkdir -p "''${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
      autoload -Uz compinit
      compinit -d "''${XDG_CACHE_HOME:-$HOME/.cache}/zsh/compdump-''${ZSH_VERSION}"
    '';

    # .zshrc
    initContent = lib.mkMerge [
      # P10K instant prompt
      (lib.mkBefore ''
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

        # Cursor and title configuration
        _set_cursor() { printf '\e[6 q'; }
        precmd_functions+=(_set_cursor)
      '')
    ];
  };
}
