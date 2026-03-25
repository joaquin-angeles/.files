{ config, ... }:

{
  imports = [
    ./home/apps.nix
    ./home/dotfiles.nix
    ./home/environment.nix
    ./home/services.nix
  ];

  home.stateVersion = "25.05";

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

  sops = {
    defaultSopsFile = "${config.home.homeDirectory}/.files/nix/secrets/secrets.yaml";
    defaultSopsFormat = "yaml";
    age.sshKeyPaths = [ "${config.home.homeDirectory}/.ssh/id_ed25519" ];

    secrets = {
      "mopidy-spotify-username" = { };
      "mopidy-spotify-password" = { };
      "mopidy-spotify-client-id" = { };
      "mopidy-spotify-client-secret" = { };
    };
  };
}
