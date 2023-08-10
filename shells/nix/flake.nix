{
  description = "A basic flake with a shell";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { nixpkgs, flake-utils, ... }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    pkgs.callPackage ../_common/shell.nix {
      packages = with pkgs; [
        niv
        nixfmt
        rnix-lsp
        statix
        vulnix
      ];
    }
  );
}
