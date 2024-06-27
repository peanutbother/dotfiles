{
  system = "x86_64-linux";
  user = "yuna";
  repo = "/mnt/share/.nix";

  # optionally override config
  # config = {
  #   inputs,
  #   mkHome,
  #   homebrew,
  #   ...
  # }: [
  #   # homebrew
  #   (homebrew {inherit user;})
  #   # home
  #   (mkHome {inherit user repo;})
  # ];

  # or just append modules
  modules = inputs:
    with inputs; [
      # quirks
      nixos-hardware.nixosModules.apple-macbook-pro-12-1
      nixos-hardware.nixosModules.common-hidpi
    ];
}
