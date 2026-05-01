{ lib, ... }:

with lib;

{
  options.features = {
    gaming.enable = mkEnableOption "gaming support";
    webapps.enable = mkEnableOption "web applications";
  };

  # Enable or disable gaming / webapps
  config.features = {
    gaming.enable = mkDefault false;
    webapps.enable = mkDefault true;
  };
}
