{ lib, ... }:

with lib;

{
  options.features = {
    gaming.enable = mkEnableOption "Gaming support";
    webapps.enable = mkEnableOption "Web applications";
  };

  # Enable or disable gaming / webapps
  # Change true -> false, vice versa
  config.features = {
    gaming.enable = true;
    webapps.enable = true;
  };
}
