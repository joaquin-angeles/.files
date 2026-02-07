{ ... }:

{
    programs.waybar.settings = {
        mainBar = {
            layer = "top";
            position = "top";
            height = 0;
            spacing = 0;

            modules-left = [
                "custom/menu"
                "hyprland/workspaces"
            ];

            modules-center = [ "hyprland/window" ];

            modules-right = [
                "group/sys-info"
                "clock"
                "custom/power"
                "tray"
            ];
        };
    }
}
