{ ... }:

{
  programs.waybar.settings.mainBar = {
    "river/tags" = {
      num-tags = 9;
      disable-scroll = true;
      all-outputs = false;
      tag-labels = [
        ""
        ""
        "󰙯"
        ""
        ""
        "6"
        "7"
        "8"
        "9"
      ];
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
        "network"
        "pulseaudio"
      ];
    };

    "custom/expand-icon" = {
      format = "";
      tooltip = false;
    };

    tray = {
      icon-size = 18;
      spacing = 9;
      reverse-direction = true;
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
      on-click = "foot -e impala";
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
      on-click = "foot -e wiremix";
      tooltip-format = "Device: {desc}\nVolume: {volume}%";
    };

    battery = {
      format = "{icon}  {capacity}%";
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
      format-full = "󱟢  {capacity}%";
      format-charging = "󰂄  {capacity}%";
      format-warning = "󰂃  {capacity}%";
      states = {
        good = 80;
        low = 30;
        critical = 19;
      };
      interval = 1;
    };

    clock = {
      format = "{:%H:%M}";
      tooltip-format = "{:%d - %A}";
      interval = 60;
    };
  };
}
