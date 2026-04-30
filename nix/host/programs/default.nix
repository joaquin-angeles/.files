{ pkgs, ... }:

{
  programs.dconf.enable = true; # GTK settings compatibility

  # Used wayland compositor
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
