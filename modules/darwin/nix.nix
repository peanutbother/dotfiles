{
  nix = {
    # enable flakes
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    # cofigure nix to use build users
    configureBuildUsers = true;
    settings = {
      # automatically hotlink duplicate files
      auto-optimise-store = true;
      # sandbox builds
      sandbox = true;
    };
  };

  # allow proprietary software
  nixpkgs.config.allowUnfree = true;

  # add custom overlays
  nixpkgs.overlays = import ../../overlays;

  # activate nix daemon
  services.nix-daemon.enable = true;
}
