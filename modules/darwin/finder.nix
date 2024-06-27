{lib, ...}: {
  system.defaults = {
    finder = {
      AppleShowAllExtensions = lib.mkDefault true;
      AppleShowAllFiles = lib.mkDefault true;
      FXEnableExtensionChangeWarning = lib.mkDefault false;
      _FXShowPosixPathInTitle = lib.mkDefault true; # show full path in finder title
      FXPreferredViewStyle = lib.mkDefault "Nlsv"; # default to list view
    };
    NSGlobalDomain = {
      AppleShowAllExtensions = lib.mkDefault true;
      AppleShowAllFiles = lib.mkDefault true;
      NSNavPanelExpandedStateForSaveMode = lib.mkDefault true;
      NSNavPanelExpandedStateForSaveMode2 = lib.mkDefault true;
    };
  };
}
