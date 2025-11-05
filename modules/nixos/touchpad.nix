{lib, ...}: {
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = lib.mkDefault true;
}
