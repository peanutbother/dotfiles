{
  system.stateVersion = 4;

  homebrew = {
    masApps = {
      telegram = 747648890;
      WCHSerialPort = 1580700717;
    };
    casks = [
      "discord"
      "istat-menus"
      "mounty"
      "notunes"
      "rectangle"
      "signal"
      "spotify"
      "vivaldi"
    ];
  };

  networking = rec {
    computerName = hostName;
    hostName = "yubook";
    localHostName = hostName;
  };
}
