{ ... }:

{
    programs.waybar.settings.mainBar = {
        # Module definitions
        "hyprland/window" = {
            max-length = 64;
            separate-outputs = false;
            format = "󰣆   {title}";
            rewrite = {
                "(.*) " = "   Empty";
            };
        };

        "hyprland/workspaces" = {
            format = "{icon}";
            format-icons = {
                # active = "";
                # default = "";
                "1" = "";
                "2" = "";
                "3" = "";
                "4" = "";
                "5" = "";
                "6" = "";
                "7" = "7";
                "8" = "8";
                "9" = "9";
            };
            disable-scroll = true;
            all-outputs = true;
            active-only = false;
            on-click = "activate";
            persistent-workspaces = {
                "*" = 6;
            };
        };

        network = {
            interface = "wlan0";
            format = "{icon}";
            format-icons = [ "󰤟" "󰤢" "󰤥" "󰤨" ];
            format-disconnected = "󰤭";
            format-ethernet = "󰈀";
            tooltip-format = "Connected to {essid}\nNetwork speed: {signalStrength}%";
            on-click = "alacritty --title='Network Manager' -e impala";
        };

        pulseaudio = {
            format = "{icon}";
            format-muted = "󰖁";
            format-icons = {
                default = [ "󰝟" "󰕿" "󰖀" "󰕾" ];
            };
            on-click = "alacritty --title='Volume Control' -e wiremix";
            tooltip-format = "Device: {desc}\nVolume: {volume}%";
        };

        battery = {
            format = "{icon}";
            format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
            format-full = "󱈑";
            format-charging = "󰂄";
            format-warning = "󰂃";
            tooltip = true;
            tooltip-format = "Status: Discharging\nBattery: {capacity}%";
            tooltip-format-charging = "Status: Charging\nBattery: {capacity}%";
            tooltip-format-full = "Status: Fully charged\nBattery: {capacity}%";
            interval = 1;
            states = {
                good = 80;
                low = 30;
                critical = 19;
            };
        };

        clock = {
            format = "{:%H:%M}";
            tooltip = true;
            tooltip-format = "{:%b %d, %Y on a %A}";
            interval = 1;
        };

        tray = {
            icon-size = 18;
            spacing = 9;
            reverse-direction = true;
        };

        "group/sys-info" = {
            orientation = "horizontal";
            modules = [
                "tray"
                "pulseaudio"
                "battery"
            ];
        };

        "custom/power" = {
            format = "󰐥";
            tooltip = true;
            tooltip-format = "Power menu";
            on-click = "power-menu.sh";
        };

        "custom/menu" = {
            format = "";
            tooltip = true;
            tooltip-format = "drun";
            on-click = "rofi -show drun";
        };
    };
}
