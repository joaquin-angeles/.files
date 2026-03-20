{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    env = [
      "HYPRCURSOR_THEME, Bibata-Modern-Ice"
      "HYPRCURSOR_SIZE,  24"
    ];

    cursor = {
      inactive_timeout = 30;
      no_hardware_cursors = true;
    };

    decoration = {
      rounding = 0;
      rounding_power = 2;

      blur = {
        enabled = true;
        new_optimizations = true;
        size = 5;
        passes = 2;
        noise = 0.02;
        contrast = 0.85;
        brightness = 0.8;
        vibrancy = 0;
      };

      shadow = {
        enabled = true;
        range = 4;
      };
    };

    general = {
      allow_tearing = false;
      gaps_in = 6;
      gaps_out = 12;
      border_size = 1;
      "col.active_border" = "rgb(404344)";
      "col.inactive_border" = "rgba(1d2021cc)";
    };

    group = {
      "col.border_active" = "rgba(7daea3bf)";
      "col.border_inactive" = "rgba(40434480)";

      groupbar = {
        render_titles = false;
        indicator_height = 3;
        font_size = 15;
        text_color = "rgb(d4be98)";
        "col.active" = "rgb(404344)";
        "col.inactive" = "rgba(1d2021cc)";
      };
    };

    windowrule = [
      "match:float 1, rounding 7"

      # Smart borders — single tiled window
      "border_size 0, match:float 0, match:workspace w[tv1]"
      "rounding 0,    match:float 0, match:workspace w[tv1]"

      # Smart borders — fullscreen
      "border_size 0, match:float 0, match:workspace f[1]"
      "rounding 0,    match:float 0, match:workspace f[1]"
    ];
  };
}
