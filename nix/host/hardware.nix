{ ... }:
{
  imports = [
    ./hardware/laptop.nix
    ./hardware/nvidia.nix
  ];

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 512;
        "default.clock.min-quantum" = 128;
        "default.clock.max-quantum" = 2048;
      };
    };
  };

  # Hardware
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  # Input
  services.libinput.enable = true;

  # Zram
  zramSwap = {
    algorithm = "zstd";
    enable = true;
    memoryPercent = 50;
    priority = 50;
    swapDevices = 1;
  };
}
