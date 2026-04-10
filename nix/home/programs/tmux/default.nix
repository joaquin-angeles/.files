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

      bind c new-window
      bind C new-window -c "#{pane_current_path}"
      bind q kill-pane
      bind Q kill-window
      bind -n M-n next-window
      bind -n M-p previous-window
      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5
      bind -n M-6 select-window -t 6
      bind -n M-7 select-window -t 7
      bind -n M-8 select-window -t 8
      bind -n M-9 select-window -t 9
    '';
  };
}
