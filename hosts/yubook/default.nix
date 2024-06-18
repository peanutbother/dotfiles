{ inputs, mkSystem, mkHome, host }:
with inputs;
let
  user = "yuna";
  repo = "/Volumes/Share/.nix";
in
[
  # system
  (mkSystem { darwin = true; })


  # homebrew
  nix-homebrew.darwinModules.nix-homebrew
  {
    nix-homebrew = {
      inherit user;

      enable = true;
      enableRosetta = true;
      mutableTaps = true;
      autoMigrate = true;

      taps = {
        "homebrew/homebrew-core" = homebrew-core;
        "homebrew/homebrew-cask" = homebrew-cask;
      };
    };
  }

  # link nix apps to darwin (fix spotlight, dock)
  mac-app-util.darwinModules.default

  # home
  home-manager.darwinModule
  (mkHome { inherit user repo; })
]
