{
  config,
  lib,
  ...
}:
let
  readPci = path: lib.removeSuffix "\n" (builtins.readFile path);
  findGpu =
    classId: vendorId:
    let
      devs = "/sys/bus/pci/devices";
    in
    lib.findFirst (
      dev:
      lib.hasPrefix classId (readPci "${devs}/${dev}/class")
      && readPci "${devs}/${dev}/vendor" == vendorId
    ) null (builtins.attrNames (builtins.readDir devs));

  busId =
    pciPath:
    let
      p = lib.splitString ":" (lib.removePrefix "0000:" pciPath);
      q = lib.splitString "." (builtins.elemAt p 1);
    in
    "PCI:${builtins.elemAt p 0}:${builtins.elemAt q 0}:${builtins.elemAt q 1}";
  nvBusId = busId (findGpu "0x0302" "0x10de");
  amdBusId = busId (findGpu "0x0300" "0x1002");
in
{
  boot.blacklistedKernelModules = [ "nouveau" ];
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.finegrained = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      nvidiaBusId = nvBusId;
      amdgpuBusId = amdBusId;
    };
  };
}
