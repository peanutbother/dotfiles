{inputs, ...}: (
  system: let
    pkgs = import inputs.nixpkgs-unstable {inherit system;};
    packages = with pkgs;
      [
        avrdude
        rustup
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
      name = "embedded";
      shellHook = ''
        if [ -f .env ]; then
          echo direnv: loading local .env
          source .env
        fi

        avrdude 2>&1 1>/dev/null | tail -n 1
        rustc --version
      '';
    }
)
