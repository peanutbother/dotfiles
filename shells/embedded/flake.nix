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
        avrdude
        rustup
      ];
      hook = ''
        avrdude 2>&1 1>/dev/null | tail -n 1
        rustc --version
      '';
    }
  );
}
