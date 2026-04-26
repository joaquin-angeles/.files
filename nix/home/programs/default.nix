{ ... }:

{
  imports = [
    # Program configurations
    ./firefox # Web browser
    ./foot # (Wayland) terminal emulator
    # ./lutris # Game launcher
    ./neovim
    # ./rmpc # Local music player
    ./rofi # Menu
    ./tmux # Terminal multiplexer
    ./waybar # (Wayland) status bar
    # ./yazi # Terminal file manager
    ./zsh # Interactive shell
  ];

  # Better nixos-rebuild outputs
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };

  # System monitor
  programs.btop = {
    enable = true;

    # Theming settings
    settings = {
      color_theme = "gruvbox_material_dark"; # Preferred colorscheme
      theme_background = false; # Enable transparency
    };
  };
}
