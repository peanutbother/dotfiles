{
  system.stateVersion = 4;

  homebrew = {
    # caskArgs.no_quarantine = false;
    masApps = {
      telegram = 747648890;
      WCHSerialPort = 1580700717;
    };
    # taps = [
    #   "armcord/armcord"
    # ];
    casks = [
      # "armcord"
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
