{
  system.stateVersion = 4;

  services.tailscale = {
    enable = true;
  };

  homebrew = {
    # masApps = {
    #   WCHSerialPort = 1580700717;
    # };
    brews = [
    ];
    casks = [
      "flux-markdown"
      "krita"
      "mounty"
      "paragon-extfs"
      "vivaldi"
    ];
  };
}
