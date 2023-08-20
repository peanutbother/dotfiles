{
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global = {
      autoUpdate = false;
      brewfile = true;
    };
    onActivation = {
      autoUpdate = false;
    };
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
}
