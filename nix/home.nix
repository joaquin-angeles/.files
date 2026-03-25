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
    defaultSopsFile = ./home/secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "${config.home.homeDirectory}/.secrets/age.key";

    secrets = {
      "mopidy-spotify-username" = { };
      "mopidy-spotify-password" = { };
      "mopidy-spotify-client-id" = { };
      "mopidy-spotify-client-secret" = { };
    };
  };

  systemd.user.services.sops-nix.after = [ "default.target" ];
}
