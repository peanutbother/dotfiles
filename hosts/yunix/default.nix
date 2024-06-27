{
  system = "x86_64-linux";
  type = "nixos";

  config = {
    inputs,
    mkHome,
    ...
  }:
    with inputs; let
      user = "yuna";
      repo = "/mnt/share/.nix";
    in [
      # quirks
      nixos-hardware.nixosModules.apple-macbook-pro-12-1
      nixos-hardware.nixosModules.common-hidpi

      # home
      (mkHome {inherit user repo;})
    ];
}
