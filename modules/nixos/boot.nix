{ lib, ... }: {
  boot = {
    # Bootloader.
    loader = {
      systemd-boot.enable = lib.mkDefault true;
      efi.canTouchEfiVariables = lib.mkDefault true;
    };
    # Boot graphics
    plymouth.enable = true;
  };
}
