{
  system.stateVersion = 4;

  services.tailscale = {
    enable = true;
  };

  homebrew = {
    brews = [
    ];
    casks = [
      "flux-markdown"
      "mounty"
      "paragon-extfs"
      "vivaldi"
    ];
  };
}
