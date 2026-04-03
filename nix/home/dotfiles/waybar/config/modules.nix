{ ... }:

{
  programs.waybar.settings.mainBar = {
    # Module definitions
    "river/window" = {
      max-length = 64;
      format = " {title}";
      rewrite = {
        "(.*) " = " wbg";
      };
    };

    "river/tags" = {
      num-tags = 9;
      tag-labels = [
        "󰇧"
        ""
        "󱆖"
        "󰝚"
        "󰊴"
        "󰈙"
        "7"
        "8"
        "9"
      ];
      disable-scroll = true;
      all-outputs = true;
    };

    mpris = {
      format = "󰏤  {title} – {artist}";
      format-paused = "󰐊  {title} – {artist}";
      max-length = 32;
      tooltip = false;
      ignored-players = [
        "firefox"
        "zen"
      ];
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
      on-click = "footclient --title='Network Manager' -e impala";
    };

    bluetooth = {
      format = "󰂯";
      format-disabled = "󰂳";
      format-off = "󰂲";
      format-connected = "󰂱";
      tooltip-format = "Bluetooth: {status}";
      tooltip-format-connected = "{controller_alias}\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "  {device_alias}";
      on-click = "footclient --title='Bluetooth Manager' -e bluetui";
    };

    pulseaudio = {
      format = "{icon}";
      format-muted = "󰖁";
      format-icons = {
        default = [
          "󰝟"
          "󰖀"
          "󰖀"
          "󰕾"
        ];
      };
      on-click = "footclient --title='Volume Control' -e wiremix";
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
