{ config, lib, ... }:

with lib;

let
  cfg = config.features.gaming;
in
{
  options.features.gaming.enable = mkEnableOption "gaming support";

  config = mkIf cfg.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
