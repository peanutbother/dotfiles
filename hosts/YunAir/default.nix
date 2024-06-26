{ inputs, mkSystem, mkHome, host, homebrew }:
with inputs;
let
  user = "yuna";
  repo = "/Volumes/Share/.nix";
in
[
  # system
  (mkSystem { darwin = true; })

  # homebrew
  (homebrew { inherit user; })

  # link nix apps to darwin (fix spotlight, dock)
  mac-app-util.darwinModules.default

  # home
  home-manager.darwinModule
  (mkHome { inherit user repo; })
]
