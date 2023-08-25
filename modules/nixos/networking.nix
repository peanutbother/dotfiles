{ lib, ... }: {
  networking = {
    # Enable networking
    networkmanager.enable = lib.mkDefault true;
    useDHCP = lib.mkDefault true;
  };
}
