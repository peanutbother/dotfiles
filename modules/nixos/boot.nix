{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Setup luks disk
  boot.initrd.luks.devices."luks-ccc08f94-9a1f-4c65-8498-a18da59d6471".device = "/dev/disk/by-uuid/ccc08f94-9a1f-4c65-8498-a18da59d6471";

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  # boot.extraModProbeConfig = ''
  #   options snd_hda_intel model=mbp121
  # '';
}
