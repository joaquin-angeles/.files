{ ... }:

{
    # User configuration
    home.username = "joaquin";
    home.homeDirectory = "/home/joaquin";
    home.stateVersion = "25.05";

    # System correction
    systemd.user.systemctlPath = "/run/current-system/sw/bin/systemctl";
    systemd.user.startServices = "sd-switch";

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
