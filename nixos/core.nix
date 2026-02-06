{ config, pkgs, ... }:

{
# Boot options
    boot.kernelModules = [ "zram" ];
    boot.loader = {
        efi.canTouchEfiVariables = true;
        systemd-boot.enable = true;
    };

# Display Manager
    services.displayManager.ly.enable = true;

# Enable XDG portals
    xdg.portal = {
        enable = true;
        xdgOpenUsePortal = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-hyprland
                xdg-desktop-portal-gtk
        ];

        config = {
            common.default = [ "gtk" ];

# Hyprland desktop portal configuration
            hyprland = { 
                preferred = [ "hyprland" "gtk" ];
                "org.freedesktop.portal.FileChooser" = [ "gtk" ];
            };
        };
    };
    environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];

# Nix package manager
    nix.optimise.automatic = true;
    nix.settings = {
        auto-optimise-store = true;
        experimental-features = [ "nix-command" "flakes" ];
    };
    nixpkgs.config.allowUnfree = true;

# System version
    system.stateVersion = "25.05";

# Timezone
    time.timeZone = "Asia/Manila";
    i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocales = [ "en_GB.UTF-8/UTF-8" ];
        extraLocaleSettings = {
            LC_TIME = "en_GB.UTF-8";
        };
    };

# sudo-rs
    security.sudo.enable = false;
    security.sudo-rs.enable = true;

# User configuration
    users.users.joaquin = {
        extraGroups = [ "wheel" "input" ];
        isNormalUser = true;
        shell = pkgs.zsh;
    };
}
