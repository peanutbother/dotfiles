{ host }: {
  imports = [
    ../hosts/${host}/system.nix
    ./boot.nix
    ./console.nix
    ./fonts.nix
    ./hardware.nix
    ./i18n.nix
    ./networking.nix
    ./nix.nix
    ./sound.nix
    ./time.nix
    ./touchpad.nix
    ./xserver.nix
  ];
}
