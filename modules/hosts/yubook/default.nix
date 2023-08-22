{ inputs }:
with inputs;
let
  user = "yuna";
  host = "yubook";
in
[
  ../common.nix

  # system
  (import ../../darwin { inherit host; })

  # home
  home-manager.darwinModule
  (import ../../home-manager { inherit host user; })

  # sops-nix.darwinModules.default
]
