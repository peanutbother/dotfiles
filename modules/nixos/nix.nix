{ pkgs, ... }: {
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

  nixpkgs = {
    # Allow proprietary packages
    config.allowUnfree = true;
    # add custom overlays
    overlays = import ../../overlays;
  };
}
