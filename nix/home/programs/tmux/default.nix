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
      unbind j
      unbind k
      unbind J
      unbind K
      unbind -n M-J
      unbind -n M-K

      # Window management
      bind c new-window
      bind C new-window -c "#{pane_current_path}"
      bind q kill-pane
      bind Q kill-window
      bind v split-window -h
      bind s split-window -v

      # Pane management
      bind j select-pane -t :.+
      bind k select-pane -t :.-
      bind J swap-pane -D
      bind K swap-pane -U
      bind -n M-n next-window
      bind -n M-p previous-window
      bind -n M-h resize-pane -L 5
      bind -n M-j select-pane -t :.+
      bind -n M-k select-pane -t :.-
      bind -n M-l resize-pane -R 5
      bind -n M-J swap-pane -D
      bind -n M-K swap-pane -U

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
