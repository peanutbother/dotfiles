{ config, inputs, pkgs, ... }: {
  system.stateVersion = "23.05";

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
  };

  boot = {
    initrd = {
      # Kernel modules in initrd
      availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "usbhid" "sd_mod" "thunderbolt" ];
      kernelModules = [ "kvm-intel" "brcmfmac" ];
    };

    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = with config.boot.kernelPackages; [ ];
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
