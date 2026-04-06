{ ... }:

{
  programs.waybar.settings.mainBar = {
    "river/tags" = {
      num-tags = 9;
      disable-scroll = true;
      all-outputs = true;
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
      on-click = "foot --title='Network Manager' -e impala";
    };

    "group/sys-info" = {
      orientation = "inherit";
      drawer = {
        transition-duration = 600;
        children-class = "tray-group-item";
      };
      modules = [
        "custom/expand-icon"
        "tray"
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

    tray = {
      icon-size = 18;
      spacing = 9;
      reverse-direction = true;
    };

    bluetooth = {
      format = "󰂯";
      format-disabled = "󰂳";
      format-off = "󰂲";
      format-connected = "󰂱";
      tooltip-format = "Bluetooth: {status}";
      tooltip-format-connected = "{controller_alias}\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "  {device_alias}";
      on-click = "foot --title='Bluetooth Manager' -e bluetui";
    };

    pulseaudio = {
      format = "{icon}";
      format-muted = "󰖁";
      format-icons.default = [
        "󰝟"
        "󰖀"
        "󰖀"
        "󰕾"
      ];
      on-click = "foot --title='Volume Control' -e wiremix";
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
      tooltip-format = "{:%d - %A}";
    };
  };
}
