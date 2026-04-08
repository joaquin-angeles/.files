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
      # Lazy loading
      source ${pkgs.zsh-defer}/share/zsh-defer/zsh-defer.plugin.zsh

      zsh-defer 'autoload -Uz compinit
      if [[ -n ${config.home.homeDirectory}/.zcompdump(#qN.mh+24) ]]; then
        compinit
      else
        compinit -C
      fi'
    '';

    # .zshrc
    initContent = lib.mkMerge [
      # P10K instant prompt
      (lib.mkBefore ''
        # P10K
        if [[ -r "${config.xdg.cacheHome}/p10k-instant-prompt-${config.home.username}.zsh" ]]; then
          source "${config.xdg.cacheHome}/p10k-instant-prompt-${config.home.username}.zsh"
        fi
      '')

      # Functions and integrations
      (lib.mkAfter ''
        export POWERLEVEL9K_CONFIG_FILE="$HOME/.config/zsh/.p10k.zsh"
        [[ -f "$POWERLEVEL9K_CONFIG_FILE" ]] && source "$POWERLEVEL9K_CONFIG_FILE"

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
