{ lib, ... }:

with lib;

{
  options.features = {
    gaming.enable = mkEnableOption "Gaming support";
    webapps.enable = mkEnableOption "Web applications";
  };

  # Enable / disable features
  # Change from true -> false to disable and vice versa
  config = {
    features = {
      gaming.enable = true;
      webapps.enable = true;
    };
  };
}
