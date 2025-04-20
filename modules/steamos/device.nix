{lib, ...}: {
  jovian.devices.steamdeck = {
    enable = lib.mkDefault true;
    autoUpdate = lib.mkDefault true;
  };
}
