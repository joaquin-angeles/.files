{ ... }:
{
  programs.waybar.settings.mainBar = {
    # Module definitions
    "hyprland/window" = {
      max-length = 64;
      separate-outputs = false;
      format = " {title}";
      rewrite = {
        "(.*) " = " Empty";
      };
    };

    "hyprland/workspaces" = {
      format = "{icon}";
      format-icons = {
        # active = "";
        # default = "";
        "1" = "";
        "2" = "󰨞";
        "3" = "";
        "4" = "";
        "5" = "";
        "6" = "󰏆";
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
      format-icons = [
        "󰤟"
        "󰤢"
        "󰤥"
        "󰤨"
      ];
      format-disconnected = "󰤭";
      format-ethernet = "󰈀";
      tooltip-format = "Connected to {essid}\nNetwork speed: {signalStrength}%";
      on-click = "alacritty --title='Network Manager' -e impala";
    };

    bluetooth = {
      format = "󰂯";
      format-disabled = "󰂳";
      format-off = "󰂲";
      format-connected = "󰂱";
      tooltip-format = "Bluetooth: {status}";
      tooltip-format-connected = "{controller_alias}\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "  {device_alias}";
      on-click = "alacritty --title='Bluetooth Manager' -e bluetui";
    };

    pulseaudio = {
      format = "{icon}";
      format-muted = "󰝟";
      format-icons = {
        default = [
          ""
          ""
          ""
          ""
        ];
      };
      on-click = "alacritty --title='Volume Control' -e wiremix";
      tooltip-format = "Device: {desc}\nVolume: {volume}%";
    };

    battery = {
      format = "{icon} {capacity}%";
      format-icons = [
        "󰂎"
        "󰁺"
        "󰁻"
        "󰁼"
        "󰁽"
        "󰁾"
        "󰁿"
        "󰂀"
        "󰂁"
        "󰂂"
        "󰁹"
      ];
      format-full = "󱟢 {capacity}%";
      format-charging = "󰂄 {capacity}%";
      format-warning = "󰂃 {capacity}%";
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
      tooltip-format = "{:%d - %A}";
      interval = 1;
    };

    tray = {
      icon-size = 18;
      spacing = 9;
      reverse-direction = true;
    };

    "group/sys-info" = {
      orientation = "inherit";
      drawer = {
        transition-duration = 600;
        children-class = "tray-group-item";
      };
      modules = [
        "custom/expand-icon"
        "network"
        "bluetooth"
        "pulseaudio"
      ];
    };

    "custom/expand-icon" = {
      format = "";
      tooltip = false;
      "on-scroll-up" = "";
      "on-scroll-down" = "";
      "on-scroll-left" = "";
      "on-scroll-right" = "";
    };

    "custom/power" = {
      format = "󰐥";
      tooltip = true;
      tooltip-format = "Power menu";
      on-click = "power-menu.sh";
    };

    "custom/separator" = {
      format = "|";
      tooltip = false;
    };
  };
}
