{ ... }:

{
  imports = [
    ./modules/flatpak.nix
    ./modules/mako.nix
  ];

  # Polkit daemon for Wayland
  services.lxqt-policykit-agent.enable = true;
}
