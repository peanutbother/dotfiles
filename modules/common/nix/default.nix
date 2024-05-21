{ lib, pkgs, inputs, ... }: {
  nix = {
    # enable flakes
    settings = {
      experimental-features = lib.mkDefault [ "nix-command" "flakes" ];
      # automatically hotlink duplicate files
      # TODO do not automatically hotlink duplicate files (currently broken)[https://github.com/NixOS/nix/issues/1281]
      auto-optimise-store = lib.mkDefault (!pkgs.stdenv.hostPlatform.isDarwin);
      # sandbox builds
      sandbox = lib.mkDefault true;
      # enable binary caches
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    # enable garbage collection
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
  };

  nixpkgs = {
    # add custom overlays
    overlays = import ../../../overlays inputs;
  } // import ./nixpkgs.nix;
}
