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
    device = "/dev/xvda1";
    fsType = "ext4";
  };

  swapDevices = [
    {device = "/dev/xvda2";}
  ];
}
