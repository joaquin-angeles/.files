{ ... }:

{
    programs.waybar.settings = {
        mainBar = {
            layer = "top";
            position = "top";
            margin-left = 54;
            margin-right = 54;
            margin-top = 6;
            height = 0;
            spacing = 0;

            # Workspace numbers
            modules-left = [
                "custom/menu"
                "hyprland/window"
            ];

            # Window title
            modules-center = [ "hyprland/workspaces" ];

            # System information and clock
            modules-right = [
                "group/sys-info"
                "clock"
                "custom/power"
            ];
        };
    };
}
