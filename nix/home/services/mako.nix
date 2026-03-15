{...}: {
  services.mako = {
    enable = true;
    settings = {
      anchor = "top-right";
      layer = "overlay";
      padding = "8";
      margin = "6";
      width = 500;
      height = 125;
      default-timeout = 3000;
      text-color = "#d4be98";
      background-color = "#1d2021";
      border-color = "#303334";
      border-radius = 5;
      font = "sans-serif 14";
    };
  };
}
