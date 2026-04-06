{ ... }:

{
  imports = [
    ./programs/btop.nix # System monitor
    ./programs/hyprlock.nix
    ./programs/librewolf.nix
    ./programs/neovim.nix # Text editor
    # ./programs/lutris.nix            # Game launcher
    ./programs/rmpc.nix
    ./programs/rofi.nix # App launcher
    ./programs/tofi.nix # App launcher
  ];

  programs.nh.enable = true; # Nix helper
}
