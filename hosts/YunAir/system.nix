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
      "cliclick"
    ];
    casks = [
      "ableton-live-suite"
      "arduino-ide"
      "blackhole-2ch"
      "crossover"
      "flux-markdown"
      "krita"
      "mounty"
      "notunes"
      "obsidian"
      "paragon-extfs"
      "playcover-community"
      "steam"
      "ultimate-vocal-remover"
      "upscayl"
      "vivaldi"
      "whisky"
    ];
  };
}
