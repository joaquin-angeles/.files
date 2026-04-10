{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    prefix = "C-Space";
    sensibleOnTop = true;

    plugins = with pkgs.tmuxPlugins; [
      sensible
    ];

    extraConfig = ''
      # Keybinds
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "tmux reloaded"
      bind -n M-j select-pane -t :.+
      bind -n M-k select-pane -t :.-
      bind -n M-h resize-pane -L 5
      bind -n M-l resize-pane -R 5
      bind v split-window -h
      bind s split-window -v

      # Window / pane management
      bind c new-window
      bind C new-window -c "#{pane_current_path}"
      bind q kill-pane
      bind Q kill-window
      bind -n M-n next-window
      bind -n M-p previous-window

      # UI customizations
      set -g window-status-current-format '#I:#W'
      set -g window-status-format '#I:#W'

      # Start from 1 instead of 0
      set -g base-index 1
      set -g pane-base-index 1

      # Status line customization
      set -g status-position top
      set -g status-style fg=white,bg=default
      set -g window-status-current-style fg=blue,bg=default
      set -g status-right ""
      set -g status-justify centre
    '';
  };
}
