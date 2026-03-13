{ config, ... }:

{
    boot.blacklistedKernelModules = [ "nouveau" ]; # ❌ nouveau

    services.xserver.videoDrivers = [ "nvidia" ]; # Load Nvidia drivers for WL and X11

    # NVidia configuration
    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.finegrained = true;
        open = false;
        package = config.boot.kernelPackages.nvidiaPackages.latest;
    };

    # Offloading
    hardware.nvidia.prime = {
        offload = {
            enable = true;
            enableOffloadCmd = true;
        };
        nvidiaBusId = "PCI:1:0:0";
        amdgpuBusId = "PCI:5:0:0";
    };
}
