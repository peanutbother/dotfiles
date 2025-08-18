{
  system.stateVersion = 4;

  services.tailscale = {
    enable = true;
    # useRoutingFeatures = "both";
  };

  homebrew = {
    masApps = {
      WCHSerialPort = 1580700717;
      iStatMenus = 1319778037;
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
      "signal"
      "steam"
      "telegram"
      "ultimate-vocal-remover"
      "upscayl"
      "vivaldi"
      "whisky"
    ];
  };
}
