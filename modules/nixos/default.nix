{ host }: {
  imports = [
    ../hosts/${host}/system.nix
    ../hosts/${host}/hardware.nix
    ./boot.nix
    ./console.nix
    ../common/fonts.nix
    ./i18n.nix
    ./networking.nix
    ./nix.nix
    ./sound.nix
    ./time.nix
    ./touchpad.nix
    ./xserver.nix
  ];
}
