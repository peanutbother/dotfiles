{host, ...}: {
  imports = [
    ../../hosts/${host}/system.nix # import host specific system configuration
    ./decky-loader.nix
    ./device.nix
    ./hardware.nix
    ./steam.nix
  ];
}
