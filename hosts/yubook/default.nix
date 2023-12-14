{ inputs }:
with inputs;
let
  user = "yuna";
  host = "yubook";
in
[
  # system
  (import ../../modules/darwin { inherit host; })

  # home
  home-manager.darwinModule
  (import ../../modules/home-manager { inherit host user; repo = "/Volumes/Share/.nix"; })
]
