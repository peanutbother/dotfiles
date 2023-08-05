{
  system.stateVersion = 4;
  imports = [
    ./dock.nix # configure dock
    ./env.nix # configure environment (e.g default shell)
    ./finder.nix # configure finder
    ./fonts.nix # install fonts (e.g. NerdFonts)
    ./homebrew.nix # install homebrew apps and configure homebrew itsef
    ./keyboard.nix # settings for key repeat etc
    ./networking.nix # configure networking (e.g. hostname, dns, etc)
    ./nix.nix # configure nix itself (use flakes, etc)
    ./screen.nix # configure display of fonts etc
    ./trackpad.nix # configure trackpad (e.g. force feedback) 
  ];
}
