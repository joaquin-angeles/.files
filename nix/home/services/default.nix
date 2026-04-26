{ ... }:

{
  imports = [
    ./flatpak.nix
    ./mako.nix
  ];

  # Polkit daemon for Wayland
  services.lxqt-policykit-agent.enable = true;
}
