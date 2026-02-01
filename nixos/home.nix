{ ... }:

{
    # User configuration
    home.username = "joaquin";
    home.homeDirectory = "/home/joaquin";
    home.stateVersion = "25.05";

    # System correction
    systemd.user.systemctlPath = "/run/current-system/sw/bin/systemctl";

    # Modules
    imports = [
        # Configurations
        ./home/dotfiles.nix
        ./home/environment.nix

        # Apps
        ./home/apps.nix # Packages
        ./home/apps/theme.nix # Theming
    ];

    # User directories
    xdg.userDirs = {
        enable = true;
        createDirectories = true;
    };
}
