{ inputs, pkgs, ... }: {
  system.stateVersion = "23.05";
  networking.hostName = "yunix";

  boot = {
    initrd = {
      # Setup keyfile
      secrets = {
        # "/crypto_keyfile.bin" = null;
      };
      # Setup luks disk
      # luks.devices."luks-ccc08f94-9a1f-4c65-8498-a18da59d6471".device = "/dev/disk/by-uuid/ccc08f94-9a1f-4c65-8498-a18da59d6471";
      # Kernel modules in initrd
      availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ "kvm-intel" "brcmfmac" ];
    };

    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    extraModprobeConfig = ''
      options snd_hda_intel model=auto
      options hid_apple fnmode=2
    '';

    plymouth = {
      theme = "mac";
      themePackages = [ pkgs.plymouth-mac-theme ];
    };
  };

  programs.ssh = {
    startAgent = true;
    enableAskPassword = true;
  };

  services.xserver = {
    xkbVariant = "mac_nodeadkeys";
    displayManager = {
      autoLogin = {
        enable = true;
        user = "yuna";
      };
      sddm.enableHidpi = true;
    };
  };

  imports = [
    inputs.sops-nix.nixosModules.default
  ];
}
