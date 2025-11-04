{host, ...}: {
  imports = [
    ./decky-loader.nix
    ./device.nix
    ./hardware.nix
    ./steam.nix
    ../../hosts/${host}/system.nix # import host specific system configuration
  ];
}
