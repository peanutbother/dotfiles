{lib, ...}: let
in {
  boot.initrd.availableKernelModules = ["xen_blkfront"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/69fedf39-dd6e-41be-86cf-97506f79744d";
    fsType = "ext4";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/ba5304e2-89fa-4c70-897f-31915dc9780c";}
  ];
}
