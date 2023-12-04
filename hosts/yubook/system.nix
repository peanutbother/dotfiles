{
  system.stateVersion = 4;

  homebrew = {
    # caskArgs.no_quarantine = false;
    masApps = {
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
      "telegram"
      "vivaldi"
    ];
  };

  networking = rec {
    computerName = hostName;
    hostName = "yubook";
    localHostName = hostName;
  };
}
