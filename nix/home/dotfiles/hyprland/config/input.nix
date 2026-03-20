{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      follow_mouse = 0;
      kb_options = "caps:escape";
      accel_profile = "flat";
      force_no_accel = true;

      touchpad = {
        natural_scroll = true;
      };
    };
  };
}
