{lib, ...}: {
  jovian.steam = {
    enable = true;
    autoStart = lib.mkDefault true;
    updater.splash = "vendor";
  };
}
