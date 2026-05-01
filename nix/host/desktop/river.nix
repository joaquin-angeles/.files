{ pkgs, ... }:

{
  # River Wayland compositor setup
  programs.river-classic = {
    enable = true;

    # Disable XWayland for stricter Wayland-only environment
    xwayland.enable = false;

    # Extra tools used by River session
    extraPackages = with pkgs; [
      dash
      swayidle
      wbg
      wideriver
      wlopm
    ];
  };
}
