{
  system.defaults = {
    loginwindow = {
      DisableConsoleAccess = true;
      GuestEnabled = false;
      SHOWFULLNAME = false;
    };
    menuExtraClock = {
      Show24Hour = true;
      ShowDate = 0;
      ShowDayOfMonth = true;
    };
    NSGlobalDomain = {
      "com.apple.sound.beep.feedback" = 0; # disable sound when changing volume
      AppleInterfaceStyleSwitchesAutomatically = true; # auto dark / light mode
    };
  };
}
