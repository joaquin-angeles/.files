{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      layout = "master";
    };

    master = {
      new_status = "master";
      mfact = 0.55;
    };

    workspace = [
      "w[tv1], gapsout:0, gapsin:0"
      "f[1],   gapsout:0, gapsin:0"
    ];

    binds = {
      movefocus_cycles_fullscreen = 0;
    };
  };
}
