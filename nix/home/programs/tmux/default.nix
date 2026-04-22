{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    prefix = "C-Space";
    mouse = true;
    historyLimit = 50000;
    keyMode = "vi";
    baseIndex = 1;

    # tmux-sensible
    plugins = with pkgs.tmuxPlugins; [
      sensible
    ];
    sensibleOnTop = true;

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

      # Status line customization
      set -g status-position top
      set -g status-style fg=white,bg=default
      set -g window-status-current-style fg=cyan,bg=default
      set -g status-right ""
      set -g status-justify centre
    '';
  };
}
