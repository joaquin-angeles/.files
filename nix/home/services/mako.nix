{ ... }:

{
  services.mako = {
    enable = true;
    settings = {
      anchor = "top-right";
      layer = "overlay";
      padding = "8";
      margin = "5";
      width = 500;
      height = 125;
      markup = true;
      default-timeout = 3000;
      text-color = "#d4be98";
      background-color = "#1d2021";
      border-color = "#3C3E3E";
      border-radius = 5;
      font = "sans-serif 14";
    };
    extraConfig = ''
      [app-name=osd]
      width=260
      anchor=bottom-center
      outer-margin=5
    '';
  };
}
