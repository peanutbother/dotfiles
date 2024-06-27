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
        packages = with pkgs; [
          deno
          nodejs
          nodePackages.pnpm
          rustup
          wasmtime
          yarn
        ];
      in {
        devShells.default = pkgs.mkShell {
          inherit packages;
          shellHook = ''
            if [ -f .env ] && [ -z "$__DIRENV_SOURCED" ]; then
              echo direnv: loading local .env
              export __DIRENV_SOURCED=1
              source .env
            fi

            deno -V
            echo "node $(node --version)"
            rustc --version
            wasmtime --version
          '';
        };
      }
    );
}
