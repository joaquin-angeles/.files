{ pkgs, ... }:

{
  programs.dconf.enable = true; # GTK settings compatibility

  # Wayland compositor
  programs.river-classic = {
    enable = true;
    xwayland.enable = false;
    extraPackages = with pkgs; [
      dash
      swayidle
      wbg
      wideriver
      wlopm
    ];
  };
}
