{ ... }:
{

  home.packages = with pkgs; [
    # Shell scripts for Wayland
    (import ./grimshot.nix { inherit pkgs; })
    (import ./mako-osd.nix { inherit pkgs; })
    (import ./wlpower.nix { inherit pkgs; })
  ];
}
