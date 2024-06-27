{ inputs, mkHome, homebrew, ... }:
with inputs;
let
  user = "yuna";
  repo = "/Volumes/Share/.nix";
in
[
  # homebrew
  (homebrew { inherit user; })

  # home
  (mkHome { inherit user repo; })
]
