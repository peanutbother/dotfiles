{lib, ...}: {
  system.defaults = {
    trackpad = {
      Clicking = lib.mkDefault true;
      Dragging = lib.mkDefault true;
      TrackpadRightClick = lib.mkDefault true;
      ActuationStrength = lib.mkDefault 0; # force feedback
      FirstClickThreshold = lib.mkDefault 1; # force feedback
      SecondClickThreshold = lib.mkDefault 1; # force feedback
    };
    NSGlobalDomain = {
      "com.apple.trackpad.scaling" = lib.mkDefault 2.0; # tracking speed
      "com.apple.mouse.tapBehavior" = lib.mkDefault 1; # tap to click
    };
  };
}
