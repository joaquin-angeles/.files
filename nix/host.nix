{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Boot options
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
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config = {
      common.default = [ "gtk" ];
      river = {
        default = [
          "wlr"
          "gtk"
        ];
        "org.freedesktop.portal.FileChooser" = [ "gtk" ];
        "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
      };
      hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
        "org.freedesktop.portal.FileChooser" = [ "gtk" ];
        "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
      };
    };
  };

  # Nix package manager
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  nixpkgs.config.allowUnfree = true;

  # System version
  system.stateVersion = "25.05";

  # Timezone
  time.timeZone = "Asia/Manila";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [ "en_GB.UTF-8/UTF-8" ];
    extraLocaleSettings.LC_TIME = "en_GB.UTF-8";
  };
  services.timesyncd.extraConfig = ''
    PollIntervalMinSec=32
    PollIntervalMaxSec=2048
  '';

  # sudo-rs
  security = {
    sudo.enable = false;
    sudo-rs.enable = true;
  };

  # User configuration
  users.users.joaquin = {
    extraGroups = [
      "wheel"
      "input"
    ];
    isNormalUser = true;
    shell = pkgs.zsh;
  };
  systemd.services."home-manager-joaquin".wantedBy = lib.mkForce [ ];
  system.activationScripts.home-manager-joaquin = {
    text = ''
      ${pkgs.su}/bin/su joaquin -c "${config.home-manager.users.joaquin.home.activationPackage}/activate"
    '';
    deps = [ ];
  };
}
