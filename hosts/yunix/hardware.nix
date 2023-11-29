{ modulesPath, ... }: {
  fileSystems = {
    "/" =
      {
        device = "/dev/disk/by-uuid/24d9645b-07e3-4c51-9720-1e65a7ce11f7";
        fsType = "btrfs";
        options = [ "subvol=root" "compress=zstd" "noatime" ];
      };

    "/home" =
      {
        device = "/dev/disk/by-uuid/24d9645b-07e3-4c51-9720-1e65a7ce11f7";
        fsType = "btrfs";
        options = [ "subvol=home" "compress=zstd" "noatime" ];
      };

    "/nix" =
      {
        device = "/dev/disk/by-uuid/24d9645b-07e3-4c51-9720-1e65a7ce11f7";
        fsType = "btrfs";
        options = [ "subvol=nix" "compress=zstd" "noatime" ];
      };

    "/persist" =
      {
        device = "/dev/disk/by-uuid/24d9645b-07e3-4c51-9720-1e65a7ce11f7";
        fsType = "btrfs";
        options = [ "subvol=persist" "compress=zstd" "noatime" ];
      };

    "/var/log" =
      {
        device = "/dev/disk/by-uuid/24d9645b-07e3-4c51-9720-1e65a7ce11f7";
        fsType = "btrfs";
        options = [ "subvol=log" "compress=zstd" "noatime" ];
        neededForBoot = true;
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

  swapDevices = [ ];

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
