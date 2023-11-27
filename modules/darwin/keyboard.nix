{ lib, ... }: {
  system = {
    keyboard = {
      enableKeyMapping = lib.mkDefault true;
      nonUS.remapTilde = lib.mkDefault false;
    };
    defaults.NSGlobalDomain = {
      InitialKeyRepeat = lib.mkDefault 14;
      KeyRepeat = lib.mkDefault 1;
      "com.apple.keyboard.fnState" = lib.mkDefault true;
    };
  };
}
