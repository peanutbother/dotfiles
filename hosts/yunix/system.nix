{
  system.stateVersion = "23.05";
  networking.hostName = "yunix";

  initrd = {
    # Setup keyfile
    secrets = {
      "/crypto_keyfile.bin" = null;
    };
    # Setup luks disk
    luks.devices."luks-ccc08f94-9a1f-4c65-8498-a18da59d6471".device = "/dev/disk/by-uuid/ccc08f94-9a1f-4c65-8498-a18da59d6471";
    # Kernel modules in initrd
    availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
    kernelModules = [ ];
  };

  kernelModules = [ "kvm-intel" ];
  extraModulePackages = [ ];
  # extraModProbeConfig = ''
  #   options snd_hda_intel model=mbp121
  # '';

  programs.ssh = {
    startAgent = true;
    enableAskPassword = true;
  };

  services.xserver.xkbVariant = "mac_nodeadkeys";
}
