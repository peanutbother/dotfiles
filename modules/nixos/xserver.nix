{ lib, ... }: {
  services.xserver = {
    # Enable the X11 windowing system.
    enable = lib.mkDefault true;

    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm.enable = lib.mkDefault true;
    desktopManager.plasma5.enable = lib.mkDefault true;

    # Configure keymap in X11
    layout = lib.mkDefault "de";
    xkbModel = lib.mkDefault "pc105";
    xkbVariant = lib.mkDefault "nodeadkeys";
  };
}
