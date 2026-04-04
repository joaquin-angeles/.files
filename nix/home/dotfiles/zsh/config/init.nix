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

        mkdir -p "$HOME/.cache/zsh"
      '')

      # Functions and integrations
      (lib.mkAfter ''
        # P10K configuration
        [[ ! -f ${config.home.homeDirectory}/.p10k.zsh ]] || source ${config.home.homeDirectory}/.p10k.zsh
            
        # Faster syntax highlighting
        FAST_HIGHLIGHT[chroma-make]=0
        FAST_HIGHLIGHT[use_async]=1

        # Cursor and title configuration
        _directory_title() {
          printf '\e[6 q'
          print -Pn "\e]0;%n@%m: %~\a"
        }
        _command_title() {
          local cmd="$1"
          local skip_cmds=(
            cd ls ll la lr lt lS l dir vdir pwd z zoxide
            cat bat less more head tail
            grep egrep fgrep rg ag find fd locate
            echo which where whoami hostname date uptime uname
            clear reset exit logout
          )

          for skip in $skip_cmds; do
            if [[ "''${cmd%% *}" == "$skip" ]]; then
              return
            fi
          done

          print -Pn "\e]0;$cmd\a"
        }
        precmd_functions+=(_directory_title)
        preexec_functions+=(_command_title)
      '')
    ];
  };
}
