{ ... }:

{
  imports = [
    ./modules.nix
    ./theme.nix
  ];

  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 0;
      spacing = 0;
      # margin-top = 12;
      # margin-left = 12;
      # margin-right = 12;

      # Workspace numbers
      modules-left = [
        "hyprland/workspaces"
        "custom/separator"
        "hyprland/window"
      ];

      modules-center = [
        # "mpris"
      ];

      # System information and clock
      modules-right = [
        "group/sys-info"
        "battery"
        "custom/separator"
        "clock"
        "tray"
      ];
    };
  };
}
