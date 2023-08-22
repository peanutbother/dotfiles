{ inputs }:
with inputs;
let
  user = "yuna";
  host = "yunix";
in
[
  ../common.nix

  # quirks
  nixos-hardware.nixosModules.apple-macbook-pro-12-1
  nixos-hardware.nixosModules.common-cpu-intel
  nixos-hardware.nixosModules.common-hidpi
  nixos-hardware.nixosModules.common-pc-ssd

  # system
  (import ../../nixos { inherit host; })

  # home
  home-manager.nixosModule
  (import ../../home-manager { inherit host user; })

  sops-nix.nixosModules.default
]
