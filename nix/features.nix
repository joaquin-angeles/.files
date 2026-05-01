{ lib, ... }:

with lib;

{
  options.features = {
    gaming.enable = mkEnableOption "gaming support";
    webapps.enable = mkEnableOption "web applications";
  };

  config.features = {
    gaming.enable = mkDefault false;
    webapps.enable = mkDefault true;
  };
}
