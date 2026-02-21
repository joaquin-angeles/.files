{ ... }:

{
    # Hardware configurations
    imports = [
        ./hardware/laptop.nix # Laptop configurations
        ./hardware/nvidia.nix # Proprietary Nvidia drivers
    ];

    # Audio server configuration
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
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

    # Connectivity configurations
    hardware.bluetooth.enable = true; # Bluetooth
    services.libinput.enable = true; # Mouse/trackpad management

    # Graphics settings
    hardware.graphics = {
        enable = true; 
        enable32Bit = true;
    };

    # Zram
    zramSwap = {
        algorithm = "zstd";
        enable = true;
        memoryPercent = 50;
        priority = 50;
        swapDevices = 1;
    };
}
