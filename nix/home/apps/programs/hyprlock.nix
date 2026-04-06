{ ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      animations = {
        enabled = true;
        animation = "fadeIn, 1, 4, default";
      };

      general = {
        immediate_render = true;
        disable_loading_bar = true;
        hide_cursor = true;
      };

      background = [
        {
          monitor = "";
          path = "~/Pictures/Wallpapers/castle.jpg";
          blur_passes = 2;
          blur_size = 5;
        }
      ];

      label = [
        # TIME
        {
          monitor = "";
          text = "$TIME";
          color = "rgb(d4be98)";
          font_size = 93;
          font_family = "Arial";
          position = "800, 480";
          halign = "center";
          valign = "center";
        }
        # DATE
        {
          monitor = "";
          text = ''cmd[update:43200000] date +"%A, %B %d"'';
          color = "rgb(d4be98)";
          font_size = 20;
          font_family = "Rubik";
          position = "800, 400";
          halign = "center";
          valign = "center";
        }
      ];

      "input-field" = [
        {
          monitor = "";
          size = "265, 50";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgb(69473c)";
          inner_color = "rgb(d4be98)";
          font_color = "rgb(1d2021)";
          font_size = 13.5;
          fade_on_empty = false;
          placeholder_text = "Enter your password...";
          hide_input = false;
          check_color = "rgb(1d2021)";
          fail_color = "rgb(865054)";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          font_family = "monospace";
          capslock_color = "rgb(ea6962)";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
