{ ... }:

{
    programs.waybar.settings = {
        mainBar = {
            layer = "top";
            position = "top";
            height = 0;
            spacing = 0;

            # Workspace numbers
            modules-left = [
                "custom/menu"
                "hyprland/workspaces"
            ];

            # Window title
            modules-center = [ "hyprland/window" ];

            # System information and clock
            modules-right = [
                "group/sys-info"
                "clock"
                "custom/power"
                "tray"
            ];
        };
    };
}
