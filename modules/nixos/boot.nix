{ lib, ... }: {
  boot = {
    # Kernel options
    kernelParams = [ "quiet" "splash" ];
    consoleLogLevel = lib.mkDefault 0;
    # initrd 
    initrd.systemd.enable = lib.mkDefault true;
    # Bootloader.
    loader = {
      systemd-boot.enable = lib.mkDefault true;
      efi.canTouchEfiVariables = lib.mkDefault true;
    };
    # Boot graphics
    plymouth.enable = lib.mkDefault true;
  };
}
