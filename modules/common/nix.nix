{ lib, ... }: {
  nix = {
    # enable flakes
    extraOptions = lib.mkDefault ''
      experimental-features = nix-command flakes
    '';
    # cofigure nix to use build users
    configureBuildUsers = lib.mkDefault true;
    settings = {
      # automatically hotlink duplicate files
      auto-optimise-store = lib.mkDefault true;
      # sandbox builds
      sandbox = lib.mkDefault true;
    };
  };

  nixpkgs = {
    # Allow proprietary packages
    config.allowUnfree = lib.mkDefault true;
    # add custom overlays
    overlays = import ../../overlays;
  };

  # activate nix daemon
  services.nix-daemon.enable = lib.mkDefault true;
}
