{ hook ? "", packages, mkShell }:
let
  shell = mkShell {
    inherit packages;
    shellHook = hook + ''
      if [ -f .env ] && [ -z "$__DIRENV_SOURCED" ]; then
        echo direnv: loading local .env
        export __DIRENV_SOURCED=1
        source .env
      fi
    '';
  };
in
{
  devShells.default = shell;
  inherit packages;
}
