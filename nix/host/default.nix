{ pkgs, ... }:

{
  # Modules
  imports = [
    # System configuration
    ./hardware
    ./desktop
    ./services

    # User configuration
    ./users/joaquin.nix
  ];

  # Boot / early system
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  system.stateVersion = "25.05";

  # Nix package manager
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 1d";
  };

  # System basics
  time.timeZone = "Hongkong";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [ "en_GB.UTF-8/UTF-8" ];
    extraLocaleSettings.LC_TIME = "en_GB.UTF-8";
  };

  # Installed system packages
  environment.systemPackages = with pkgs; [
    git
    usbutils
  ];

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      corefonts
      inter
      nerd-fonts.monaspace
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      source-serif
    ];
  };

  # System-wide security
  security = {
    sudo.enable = false;
    sudo-rs.enable = true;
    polkit.enable = true;
    pam.services.gtklock = { };
  };

  # Session / Desktop support
  services.displayManager.ly.enable = true;

  programs.dconf.enable = true;

  # System services
  services.timesyncd.extraConfig = ''
    PollIntervalMinSec=32
    PollIntervalMaxSec=2048
  '';
}
