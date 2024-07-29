inputs: _: prev: {
  unstable = import inputs.nixpkgs-unstable ({
      inherit (prev) system;
    }
    // import ../modules/common/nix/nixpkgs.nix);
}
