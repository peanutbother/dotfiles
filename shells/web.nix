{inputs, ...}: (
  system: let
    pkgs = import inputs.nixpkgs-unstable {inherit system;};
    packages = with pkgs;
      [
        deno
        nodejs
        nodePackages.pnpm
        rustup
        wasmtime
        yarn
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
      name = "web";
      shellHook = ''
        if [ -f .env ] then
          echo direnv: loading local .env
          source .env
        fi

        deno -V
        echo "node $(node --version)"
        rustc --version
        wasmtime --version
      '';
    }
)
