{ pkgs, ...}: {
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings = {
      # automatically hotlink duplicate files
      auto-optimise-store = true;
      # sandbox builds
      sandbox = true;
    };
  };

  # Allow proprietary packages
  nixpkgs.config.allowUnfree = true;

  # add custom overlays
  nixpkgs.overlays = import ../../overlays;
}