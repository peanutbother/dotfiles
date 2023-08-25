{ lib, pkgs, ... }: {
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
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
}
