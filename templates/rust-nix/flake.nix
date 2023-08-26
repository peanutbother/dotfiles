{
  description = "A flake for building a Rust package.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = inputs: (import ../../util.nix).eachSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.default = pkgs.callPackage ./. { };
    }
  );
}
