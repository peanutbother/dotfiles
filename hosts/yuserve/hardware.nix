{
  boot = {
    initrd = {
      availableKernelModules = ["xen_blkfront"];
      kernelModules = [];
    };
    kernelModules = [];
    extraModulePackages = [];
    loader = {
      systemd-boot.enable = false;
      grub.enable = false;
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/2d10fb84-44e6-4cf4-8731-7460e6532b93";
    fsType = "ext4";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/accd7028-a5e1-4b1d-aef7-2f03c6f5972e";}
  ];
}
