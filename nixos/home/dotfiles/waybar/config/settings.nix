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
            height = 40;
            spacing = 0;
            margin-top = 12;
            margin-left = 12;
            margin-right = 12;

            # Workspace numbers
            modules-left = [
                "hyprland/workspaces"
                "custom/separator"
                "hyprland/window"
            ];

            # System information and clock
            modules-right = [
                "group/sys-info"
                "custom/separator"
                "clock"
                "custom/separator"
                "custom/power"
            ];
        };
    };
}
