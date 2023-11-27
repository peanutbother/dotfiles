{ lib, ... }: {
  system.defaults = {
    loginwindow = {
      DisableConsoleAccess = lib.mkDefault true;
      GuestEnabled = lib.mkDefault false;
      SHOWFULLNAME = lib.mkDefault false;
    };
    menuExtraClock = {
      Show24Hour = lib.mkDefault true;
      ShowDate = lib.mkDefault 0;
      ShowDayOfMonth = lib.mkDefault true;
    };
    NSGlobalDomain = {
      "com.apple.sound.beep.feedback" = lib.mkDefault 0; # disable sound when changing volume
      AppleInterfaceStyleSwitchesAutomatically = lib.mkDefault true; # auto dark / light mode
    };
  };
}
