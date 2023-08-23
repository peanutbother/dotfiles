{ lib, ... }: {
  networking = {
    # Enable networking
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
  };
}
