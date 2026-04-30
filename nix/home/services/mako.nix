{ ... }:

{
  services.mako = {
    # Installation
    enable = true;

    # Configuration
    settings = {
      # Options
      font = "Inter, MonaspiceNe Nerd Font Propo 14";
      anchor = "top-right";
      default-timeout = 3000;
      layer = "overlay";
      markup = true;

      # Colors
      text-color = "#d4be98";
      background-color = "#1d2021";
      border-color = "#32332f";

      # Sizing / padding
      margin = 6;
      padding = 12;
      width = 300;
      height = 150;
      border-size = 1;
      border-radius = 7;
    };

    # On-screen display setup
    extraConfig = ''
      [app-name=osd]
      text-alignment=center
      width=180
    '';
  };
}
