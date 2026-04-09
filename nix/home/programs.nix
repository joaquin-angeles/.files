{ ... }:

{
  imports = [
    # Installations
    ./programs/btop.nix # System monitor
    ./programs/hyprlock.nix
    ./programs/firefox.nix
    ./programs/neovim.nix # Text editor
    ./programs/rmpc.nix
    ./programs/rofi.nix # Run launcher
    ./programs/tofi.nix # App launcher

    # Full configurations
    ./programs/foot/program.nix
    ./programs/theme/program.nix
    ./programs/waybar/program.nix
    ./programs/yazi/program.nix
    ./programs/zellij/program.nix
    ./programs/zsh/program.nix
  ];

  programs.nh.enable = true; # Nix helper
}
