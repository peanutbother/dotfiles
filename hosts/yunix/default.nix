{ inputs, mkSystem, mkHome, ... }:
with inputs;
let
  user = "yuna";
  repo = "/mnt/share/.nix";
in
[
  # quirks
  nixos-hardware.nixosModules.apple-macbook-pro-12-1
  nixos-hardware.nixosModules.common-hidpi

  # system
  mkSystem

  # home
  (mkHome { inherit user repo; })
]
