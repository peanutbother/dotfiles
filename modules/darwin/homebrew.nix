{lib, ...}: {
  homebrew = {
    enable = lib.mkDefault true;
    caskArgs.no_quarantine = lib.mkDefault false;
    global = {
      autoUpdate = lib.mkDefault false;
      brewfile = lib.mkDefault true;
    };
    onActivation = {
      autoUpdate = lib.mkDefault true;
      upgrade = lib.mkDefault true;
    };
  };
}
