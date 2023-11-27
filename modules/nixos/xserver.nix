{ lib, pkgs, ... }:
let
  theme = pkgs.sddm-macventura-theme;
in
{
  services.xserver = {
    # Enable the X11 windowing system.
    enable = lib.mkDefault true;

    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm = {
      enable = lib.mkDefault true;
      # TODO remove if using pantheon / replace with better DM when using pantheon
      theme = "${theme.themeName}-${theme.color}";
    };
    desktopManager.plasma5.enable = lib.mkDefault true;

    # Configure keymap in X11
    layout = lib.mkDefault "de";
    xkbModel = lib.mkDefault "pc105";
    xkbVariant = lib.mkDefault "nodeadkeys";
  };

  environment.systemPackages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum # TODO remove if not needed for KDE
    sddm-kcm # TODO replace with elementary os' pantheon
    theme # TODO remove when using pantheon
  ];
}
