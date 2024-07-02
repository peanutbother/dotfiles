{
  system = "x86_64-linux";
  user = "yuna";
  repo = "/mnt/share/.nix";

  modules = inputs:
    with inputs; [
      # quirks
      nixos-hardware.nixosModules.apple-macbook-pro-12-1
      nixos-hardware.nixosModules.common-hidpi
      ../../modules/nixos
      home-manager # refers to the correct home-manager module
      ../../modules/home-manager
      ../../modules/common/homebrew.nix
    ];
}
