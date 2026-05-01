{
  config,
  lib,
  pkgs,
  ...
}:

{
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

  # Disable automatic Home Manager service (manual activation instead)
  systemd.services."home-manager-joaquin".wantedBy = lib.mkForce [ ];

  # Manual Home Manager activation hook
  system.activationScripts.home-manager-joaquin = {
    text = ''
      ${pkgs.su}/bin/su joaquin -c "${config.home-manager.users.joaquin.home.activationPackage}/activate"
    '';
    deps = [ ];
  };
}
