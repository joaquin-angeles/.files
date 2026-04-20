{ ... }:

{
  imports = [
    ./modules.nix
    ./style.nix
  ];

  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      spacing = 0;
      # margin-top = 12;
      # margin-left = 12;
      # margin-right = 12;

      # Workspace numbers
      modules-left = [
        "river/tags"
      ];

      modules-center = [
        # "mpris"
      ];

      # System information and clock
      modules-right = [
        "group/sys-info"
        "battery"
        "clock"
        "river/layout"
      ];
    };
  };
}
