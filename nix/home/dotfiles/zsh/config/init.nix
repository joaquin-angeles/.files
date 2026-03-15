{
  config,
  lib,
  ...
}: {
  programs.zsh = {
    initContent = lib.mkMerge [
      # P10K instant prompt
      (lib.mkBefore ''
        # stty intr "^G"

        # P10K instant prompt
        if [[ -r "${config.xdg.cacheHome}/p10k-instant-prompt-${config.home.username}.zsh" ]]; then
            source "${config.xdg.cacheHome}/p10k-instant-prompt-${config.home.username}.zsh"
        fi

        export ZCOMPDUMP=${config.home.homeDirectory}/.cache/zsh/compdump;
        mkdir -p "$HOME/.cache/zsh"
      '')

      # Functions and integrations
      (lib.mkAfter ''
        # P10K configuration
        [[ ! -f ${config.home.homeDirectory}/.p10k.zsh ]] || source ${config.home.homeDirectory}/.p10k.zsh

        # Cursor and title configuration
        _my_preexec() { print -Pn "\e]0;$1\a" }
        _my_precmd() {
            printf '\e[6 q'
            print -Pn "\e]0;%n@%m: %~\a"
        }
        precmd_functions+=(_my_precmd)
        preexec_functions+=(_my_preexec)

        # Better FZF (faster preview)
        function ff() {
            command fzf --preview '
                if [ -d {} ]; then
                    command -v eza >/dev/null && eza --icons always --group-directories-first --git --color=always -la {} || ls -lha --color=always group-directories-first {}
                else
                    command -v bat >/dev/null && bat {} || cat {}
                fi
            '
        }
      '')
    ];
  };
}
