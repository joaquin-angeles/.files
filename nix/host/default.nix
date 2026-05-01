{
  config,
  pkgs,
  lib,
  ...
}:
{
  # Import modular system configuration
  imports = [
    ./services
    ./hardware
  ];

  # Bootloader configuration (UEFI + systemd-boot)
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  # Login/display manager (ly = TUI login manager)
  services.displayManager.ly.enable = true;

  # XDG portal setup (needed for Flatpak + Wayland apps)
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    # Wayland portal backend (wlroots-based compositors)
    wlr.enable = true;

    # GTK portal for file dialogs, etc.
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    # Default portal selection per session
    config = {
      common.default = [ "gtk" ];
      river.default = [
        "wlr"
        "gtk"
      ];
    };
  };

  # Nix configuration (flakes + auto GC tuning)
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Garbage collection (weekly cleanup of old generations)
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # System version (DO NOT change after install unless necessary)
  system.stateVersion = "25.05";

  # Base system packages
  environment.systemPackages = with pkgs; [
    git
    usbutils
  ];

  # Timezone
  time.timeZone = "Hongkong";

  # Locale configuration
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [ "en_GB.UTF-8/UTF-8" ];
    extraLocaleSettings.LC_TIME = "en_GB.UTF-8";
  };

  # Time sync tuning (systemd-timesyncd)
  services.timesyncd.extraConfig = ''
    PollIntervalMinSec=32
    PollIntervalMaxSec=2048
  '';

  # Security configuration
  security = {
    sudo.enable = false;
    sudo-rs.enable = true; # Use sudo-rs instead of sudo
    security.polkit.enable = true; # Enable policykit
  };

  # User configuration
  users.users.joaquin = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "input"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  # Enable dconf (needed for GTK apps + GNOME settings backend)
  programs.dconf.enable = true;

  # River Wayland compositor setup
  programs.river-classic = {
    enable = true;

    # Disable XWayland for stricter Wayland-only environment
    xwayland.enable = false;

    # Extra tools used by River session
    extraPackages = with pkgs; [
      dash
      swayidle
      wbg
      wideriver
      wlopm
    ];
  };

  # Disable automatic Home Manager service (manual activation instead)
  systemd.services."home-manager-joaquin".wantedBy = lib.mkForce [ ];

  # Manual Home Manager activation hook
  system.activationScripts.home-manager-joaquin = {
    text = ''
      ${pkgs.su}/bin/su joaquin -c "${config.home-manager.users.joaquin.home.activationPackage}/activate"
    '';
    deps = [ ];
  };

  # Allow GTK lock screen PAM integration
  security.pam.services.gtklock = { };
}
