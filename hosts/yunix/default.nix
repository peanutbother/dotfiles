{ inputs, mkSystem, mkHome, host }:
with inputs;
let
  user = "yuna";
  repo = "/mnt/share/.nix";
in
[
  # quirks
  nixos-hardware.nixosModules.apple-macbook-pro-12-1
  nixos-hardware.nixosModules.common-cpu-intel
  nixos-hardware.nixosModules.common-hidpi
  nixos-hardware.nixosModules.common-pc-ssd

  # system
  (mkSystem { inherit host; })

  # home
  home-manager.nixosModule
  (mkHome { inherit host user repo; })
]
