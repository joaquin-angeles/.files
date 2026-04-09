{ ... }:

{
  imports = [
    ./programs/btop # System monitor
    ./programs/foot # Terminal emulator
    ./programs/firefox # Web browser
    ./programs/hyprlock # Lockscreen
    ./programs/neovim # Text editor
    ./programs/rmpc # Music player
    ./programs/rofi # Run launcher
    ./programs/tofi # App launcher
    ./programs/yazi # Terminal file manager
    ./programs/waybar # Status bar
    ./programs/zellij # Terminal multiplexer
    ./programs/zsh # Interactive shell
  ];

  programs.nh.enable = true; # Nix helper
}
