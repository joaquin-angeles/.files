{ ... }:

{
    # User configuration
    home.username = "joaquin";
    home.homeDirectory = "/home/joaquin";
    home.stateVersion = "25.05";

    # System correction
    systemd.user.systemctlPath = "/run/current-system/sw/bin/systemctl";
    systemd.user.startServices = "sd-switch";

    # Increase timeout limit
    systemd.user.services.home-manager-joaquin = {
        Unit.StartLimitIntervalSec = 0;
        Service = {
            TimeoutStartSec = "15min";  # Increase from default 5min
        };
    };

    # Modules
    imports = [
        # Configurations
        ./home/dotfiles.nix
        ./home/environment.nix

        # Apps
        ./home/apps.nix # Packages
        ./home/services.nix # Services
    ];

    # User directories
    xdg.userDirs = {
        enable = true;
        createDirectories = true;
    };
}
