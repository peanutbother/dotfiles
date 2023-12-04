{ lib, pkgs, ... }:
let
  theme = pkgs.sddm-macventura-theme;
in
{
  services.xserver = {
    # Enable the X11 windowing system.
    enable = lib.mkDefault true;

    excludePackages = with pkgs; [ 
      plasma5Packages.plasma-browser-integration # currently incompatible with vivaldi
      xterm # exclude xterm (we have alacritty set up)
    ];

    # Enable the KDE Plasma Desktop Environment.
    displayManager = {
      defaultSession = "plasmawayland";
      sddm = {
        enable = lib.mkDefault true;
        theme = "${theme.themeName}-${theme.color}";
      };
    };
    desktopManager.plasma5.enable = lib.mkDefault true;

    # Configure keymap in X11
    layout = lib.mkDefault "de";
    xkbModel = lib.mkDefault "pc105";
    xkbVariant = lib.mkDefault "nodeadkeys";
  };

  environment = {
    systemPackages = with pkgs; [
      libsForQt5.qtstyleplugin-kvantum
      sddm-kcm
      theme
    ];
    plasma5.excludePackages = with pkgs.libsForQt5; [
      khelpcenter
      konsole # we have alacritty ;)
    ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
