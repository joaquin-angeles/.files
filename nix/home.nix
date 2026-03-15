{...}: {
  imports = [
    ./home/apps.nix
    ./home/dotfiles.nix
    ./home/environment.nix
    ./home/services.nix
  ];

  home.stateVersion = "25.05";

  # System correction
  systemd.user.systemctlPath = "/run/current-system/sw/bin/systemctl";
  systemd.user.startServices = "sd-switch";

  # User directories
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
