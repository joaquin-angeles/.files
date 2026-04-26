{ ... }:

{
  imports = [
    ./modules
  ];

  # Polkit daemon for Wayland
  services.lxqt-policykit-agent.enable = true;
}
