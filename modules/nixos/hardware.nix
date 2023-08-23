{ modulesPath, ... }: {
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/9e60daf1-a1a9-4cf1-b6e3-39bac5b482b3";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/67E3-17ED";
      fsType = "vfat";
    };
  };

  swapDevices = [ ];

  powerManagement.enable = true;

  hardware = {
    # Enable Firmware
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = true;
    # Enable FacetimeHD
    facetimehd.enable = true;
    # Enable bluetooth
    bluetooth.enable = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  imports = [
    (modulesPath + "/hardware/network/broadcom-43xx.nix")
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
}
