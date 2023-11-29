{ modulesPath, ... }: {
  fileSystems = {
    "/" =
      {
        device = "/dev/mapper/enc";
        fsType = "ext4";
      };

    "/boot" = {
      device = "/dev/disk/by-uuid/67E3-17ED";
      fsType = "vfat";
    };

    "/mnt/share" = {
      device = "/dev/disk/by-uuid/64ED-11AE";
      fsType = "exfat";
      options = [ "uid=1000" "gid=1000" ];
    };
  };

  boot.initrd.luks.devices."enc".device = "/dev/disk/by-uuid/3f62db56-c8ff-4784-a22d-eaaca721566e";

  swapDevices = [ { device = "/.swapfile"; } ];

  powerManagement.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      # This configuration may be unnecessary and does not work with bluez5 (Unknown key Enable for group General).
      General.Enable = "Source,Sink,Media,Socket";
    };
  };
}
