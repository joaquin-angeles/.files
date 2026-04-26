{ ... }:

{
  imports = [
    ./modules.nix
    ./style.nix
  ];

  programs.waybar = {
    enable = true;

    # Top-level configuration
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 0;

        # Tag indicatord
        modules-left = [
          "river/tags"
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
  };
}
