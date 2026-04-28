{ ... }:

{
  services.mako = {
    # Installation
    enable = true;

    # Configuration
    settings = {
      anchor = "top-right";
      layer = "overlay";
      padding = 10;
      margin = 5;
      width = 300;
      height = 150;
      markup = true;
      default-timeout = 3000;
      text-color = "#d4be98";
      background-color = "#1d2021";
      border-color = "#323537";
      border-size = 1;
      border-radius = 5;
      font = "Inter, MonaspiceNe Nerd Font Propo 14";
    };

    # On-screen display setup
    extraConfig = ''
      [app-name=osd]
      width=200
      text-alignment=center
    '';
  };
}
