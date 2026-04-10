{ ... }:

{
  programs.tmux = {
    enable = true;

    prefix = "C-Space";
    sensibleOnTop = true;

    plugins = with pkgs.tmuxPlugins; [
      sensible
    ];

    extraConfig = ''
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "tmux reloaded"
      bind -n M-j select-pane -t :.+
      bind -n M-k select-pane -t :.-
      bind -n M-h resize-pane -L 5
      bind -n M-l resize-pane -R 5
      bind v split-window -h
      bind s split-window -v

      set -g status-position top
      set -g status-style fg=white,bg=default
      set -g window-status-current-style fg=blue,bg=default
      set -g status-right ""
      set -g status-justify centre
    '';
  };
}
