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
            height = 35;
            spacing = 0;
            # margin-top = 12;
            # margin-left = 12;
            # margin-right = 12;

            # Workspace numbers
            modules-left = [
                "niri/workspaces"
                "custom/separator"
                "niri/window"
            ];

            # System information and clock
            modules-right = [
                "group/sys-info"
                "clock"
                "custom/power"
            ];
        };
    };
}
