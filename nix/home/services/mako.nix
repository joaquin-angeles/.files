{ ... }:

{
  services.mako = {
    # Installation
    enable = true;

    # Configuration
    settings = {
      anchor = "top-right";
      layer = "overlay";
      padding = 12;
      margin = 6;
      outer-margin = 6;
      width = 300;
      height = 150;
      markup = true;
      default-timeout = 3000;
      text-color = "#d4be98";
      background-color = "#1d2021";
      border-color = "#32332f";
      border-size = 1;
      border-radius = 7;
      font = "Inter, MonaspiceNe Nerd Font Propo 14";
    };

    # On-screen display setup
    extraConfig = ''
      [app-name=osd]
      anchor=bottom-center
      text-alignment=center
      width=200
    '';
  };
}
