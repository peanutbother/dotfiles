{ lib, pkgs, ... }: {
  nix = {
    # enable flakes
    extraOptions = lib.mkDefault ''
      experimental-features = nix-command flakes
    '';
    settings = {
      # automatically hotlink duplicate files
      auto-optimise-store = lib.mkDefault true;
      # sandbox builds
      sandbox = lib.mkDefault true;
    };
    # enable garbage collection
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
  };

  nixpkgs = {
    # Allow proprietary packages
    config.allowUnfree = true;
    # add custom overlays
    overlays = import ../../overlays;
  };
}
