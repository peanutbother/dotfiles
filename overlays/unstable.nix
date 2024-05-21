inputs: final: prev: {
  unstable = import inputs.nixpkgs-unstable ({
    system = prev.system;
  } // import ../modules/common/nix/nixpkgs.nix);
}
