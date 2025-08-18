{lib, ...}: {
  jovian.steam = {
    enable = lib.mkDefault true;
    autoStart = lib.mkDefault true;
    updater.splash = lib.mkDefault "vendor";
  };
}
