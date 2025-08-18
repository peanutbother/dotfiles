{
  system.stateVersion = 4;

  services.tailscale = {
    enable = true;
    # useRoutingFeatures = "both";
  };

  homebrew = {
    masApps = {
      WCHSerialPort = 1580700717;
    };
    brews = [
      "cliclick"
    ];
    casks = [
      "ableton-live-suite"
      "arduino-ide"
      "blackhole-2ch"
      "crossover"
      "krita"
      "mounty"
      "notunes"
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
