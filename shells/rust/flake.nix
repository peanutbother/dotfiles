{
  description = "A basic flake with a shell";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };
  outputs = {nixpkgs, ...} @ inputs: let
    stateVersion = "23.11";
  in
    (import ../../util.nix inputs stateVersion).eachSystem
    (
      system: let
        pkgs = import nixpkgs {inherit system;};
        packages = with pkgs;
          [
            iconv
            rustup
          ]
          ++ (
            if system == "aarch64-darwin" || system == "x86_64-darwin"
            then
              with pkgs; [
                darwin.apple_sdk.frameworks.Security
                darwin.apple_sdk.frameworks.SystemConfiguration
              ]
            else []
          );
      in {
        devShells.default = pkgs.mkShell {
          inherit packages;
          shellHook = ''
            if [ -f .env ] && [ -z "$__DIRENV_SOURCED" ]; then
              echo direnv: loading local .env
              export __DIRENV_SOURCED=1
              source .env
            fi

            rustc --version
          '';
        };
      }
    );
}
