{host, ...}: {
  imports = [
    ./boot.nix # configure boot settings
    ./console.nix # configure console layout, etc
    ./desktop.nix # configure desktop and window managers
    ../common/fonts.nix # install fonts (e.g. NerdFonts)
    ./i18n.nix # configure language
    ./networking.nix # configure networking management
    ./nix.nix # configure nix settings
    ./sound.nix # enable sound
    ./time.nix # configure timezone
    ./touchpad.nix # configure trackpad (e.g. force feedback)
    ../../hosts/${host}/hardware.nix # import host specific hardware configuration
    ../../hosts/${host}/system.nix # import host specific system configuration
  ];
}
