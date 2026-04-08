{
  config,
  pkgs,
  lib,
  ...
}:

let
  portalFileChooser = {
    "org.freedesktop.portal.FileChooser" = [ "gtk" ];
  };
  portalSettings = {
    "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
  };
  compositorPortal = backends: { default = backends; } // portalFileChooser // portalSettings;
in
{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  services.displayManager.ly.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config = {
      common.default = [ "gtk" ];
      river = compositorPortal [
        "wlr"
        "gtk"
      ];
      hyprland = compositorPortal [
        "hyprland"
        "gtk"
      ];
    };
  };

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  system.stateVersion = "25.05";

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

  security = {
    sudo.enable = false;
    sudo-rs.enable = true;
  };

  users.users.joaquin = {
    extraGroups = [
      "wheel"
      "input"
    ];
    isNormalUser = true;
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  systemd.services."home-manager-joaquin".wantedBy = lib.mkForce [ ];
  system.activationScripts.home-manager-joaquin = {
    text = ''
      ${pkgs.su}/bin/su joaquin -c "${config.home-manager.users.joaquin.home.activationPackage}/activate"
    '';
    deps = [ ];
  };
}
