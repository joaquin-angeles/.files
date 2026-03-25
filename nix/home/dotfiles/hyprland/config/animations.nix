{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;

      bezier = [
        "linear, 0, 0, 1, 1"
        "wind, 0.05, 0.69, 0.1, 1"
        "easeOutQuint, 0.23, 1, 0.32, 1"
        "easeInOutCubic, 0.65, 0.05, 0.36, 1"
      ];

      animation = [
        # Fade
        "fadeIn, 1, 4, easeOutQuint"
        "fadeOut, 1, 4, easeInOutCubic"

        # Windows
        "windowsMove, 1, 2, wind"
        "windowsIn, 1, 4, easeOutQuint, popin 95%"
        "windowsOut, 1, 4, easeInOutCubic, popin 95%"
        "border, 1, 3, linear"

        # Workspaces
        "workspaces, 1, 3, linear, fade"
      ];
    };
  };
}
