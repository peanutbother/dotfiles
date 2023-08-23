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
  };
}
