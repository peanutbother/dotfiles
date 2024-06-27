{lib, ...}: {
  system.defaults = {
    NSGlobalDomain = {
      AppleFontSmoothing = lib.mkDefault 1;
    };
  };
}
