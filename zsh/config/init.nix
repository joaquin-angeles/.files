{ config, lib, ... }:

{
    programs.zsh = {
        initContent = lib.mkMerge [
            # P10K instant prompt
            (lib.mkBefore ''
                # stty intr "^G"

                # P10K instant prompt
                if [[ -r "${config.xdg.cacheHome}/p10k-instant-prompt-${config.home.username}.zsh" ]]; then
                    source "${config.xdg.cacheHome}/p10k-instant-prompt-${config.home.username}.zsh"
                fi
            '')

            # Functions and integrations
            ''
                # P10K configuration
                source ${config.home.homeDirectory}/.zsh/plugins/powerlevel10k/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
                [[ ! -f ${config.home.homeDirectory}/.p10k.zsh ]] || source ${config.home.homeDirectory}/.p10k.zsh

                # Cursor and title configuration
                autoload -Uz add-zsh-hook
                add-zsh-hook precmd () {
                    printf '\e[6 q'
                    print -Pn "\e]0;%n@%m: %~\a"
                }

                # Better FZF (faster preview)
                function ff() {
                    command fzf --preview '
                        if [ -d {} ]; then
                            command -v eza >/dev/null && eza --icons always --group-directories-first --git --color=always {} || ls -lh {}
                        else
                            command -v bat >/dev/null && bat --color=always {} || cat {}
                        fi
                    '
                }
            ''
        ];
    };
}
