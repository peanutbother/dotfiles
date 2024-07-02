{inputs, ...}: (
  system: let
    pkgs = import inputs.nixpkgs-unstable {inherit system;};
    packages = with pkgs;
      [
        alejandra
        niv
        nixd
        statix
        vulnix
      ]
      ++ (
        if pkgs.stdenv.hostPlatform.isDarwin
        then
          with pkgs; [
            darwin.apple_sdk.frameworks.Foundation
          ]
        else []
      );
  in
    pkgs.mkShell {
      inherit packages;
      name = "nix";
      shellHook = ''
        if [ -f .env ] then
          echo direnv: loading local .env
          source .env
        fi
      '';
    }
)
