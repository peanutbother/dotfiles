{ inputs, mkSystem, mkHome, host }:
with inputs;
let
  user = "yuna";
  repo = "/Volumes/Share/.nix";
in
[
  # system
  (mkSystem { darwin = true; })

  # home
  home-manager.darwinModule
  (mkHome { inherit user repo; })
]
