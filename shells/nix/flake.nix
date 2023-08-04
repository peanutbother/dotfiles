{
  description = "A basic flake with a shell";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
      shell = pkgs.mkShell {
        packages = with pkgs; [
          nixpkgs-fmt
          rnix-lsp
        ];

        shellHook = ''
          if [ -f .env ]; then
            echo direnv: loading local .env
            source .env
          fi
        '';
      };
    in
    {
      devShells.default = shell;
      # packages.default = shell;
    }
  );
}
