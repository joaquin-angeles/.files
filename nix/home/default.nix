{ ... }:

{
  imports = [
    # Environment
    ./environment.nix
    ./xdg.nix

    # Lists and configurations
    ./packages
    ./programs
    ./services
    ./theming
  ];

  home = {
    username = "joaquin";
    homeDirectory = "/home/joaquin";
    stateVersion = "25.05";
  };

  # System correction
  systemd = {
    user = {
      systemctlPath = "/run/current-system/sw/bin/systemctl";
      startServices = "sd-switch";
    };
  };

  # User directories
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
