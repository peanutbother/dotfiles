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
    device = "/dev/disk/by-uuid/bf3f2590-e002-4fe0-9632-cba976824ad8";
    fsType = "ext4";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/699bb45c-a0f3-42f2-bec3-43ea532de590";}
  ];
}
