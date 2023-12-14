{ inputs }:
with inputs; let
  user = "yuna";
  host = "yunix";
in
[
  # quirks
  nixos-hardware.nixosModules.apple-macbook-pro-12-1
  nixos-hardware.nixosModules.common-cpu-intel
  nixos-hardware.nixosModules.common-hidpi
  nixos-hardware.nixosModules.common-pc-ssd

  # system
  (import ../../modules/nixos { inherit host; })

  # home
  home-manager.nixosModule
  (import ../../modules/home-manager { inherit host user; repo = "/mnt/share/.nix"; })
]
