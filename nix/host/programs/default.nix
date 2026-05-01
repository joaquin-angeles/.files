{ pkgs, ... }:

{
  imports = [
    ./gaming.nix
  ];

  programs.dconf.enable = true; # GTK settings compatibility

  # Wayland compositor
  programs.river-classic = {
    enable = true;
    extraPackages = with pkgs; [
      dash
      swayidle
      wbg
      wideriver
      wlopm
    ];
  };
}
