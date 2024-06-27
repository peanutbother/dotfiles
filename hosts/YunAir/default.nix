{ inputs, mkSystem, mkHome, homebrew, ... }:
with inputs;
let
  user = "yuna";
  repo = "/Volumes/Share/.nix";
in
[
  # system
  mkSystem

  # homebrew
  (homebrew { inherit user; })

  # home
  (mkHome { inherit user repo; })
]
