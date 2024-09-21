{
  host,
  inputs,
  ...
}: {
  imports = [
    inputs.mac-app-util.darwinModules.default # link nix apps to darwin (fix spotlight, dock)
    ../../hosts/${host}/system.nix # import host specific system configuration
    ./dock.nix # configure dock
    ./env.nix # configure environment (e.g default shell)
    ./finder.nix # configure finder
    ../common/fonts.nix # install fonts (e.g. NerdFonts)
    ./homebrew.nix # install homebrew apps and configure homebrew itsef
    ./keyboard.nix # settings for key repeat etc
    ./mouse.nix # configure mouse (acceleration, etc)
    ./networking.nix # configure networking (e.g. hostname, dns, etc)
    ./nix.nix # configure nix itself (use flakes, etc)
    ./screen.nix # configure display of fonts etc
    ./system.nix # configure system settings
    ./security.nix # configure security settings
    ./trackpad.nix # configure trackpad (e.g. force feedback)
  ];
}
