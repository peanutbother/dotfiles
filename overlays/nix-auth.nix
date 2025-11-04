inputs: final: prev: let
  nix-auth = inputs.nix-auth.packages.${final.system}.default;
in {
  inherit nix-auth;
}
