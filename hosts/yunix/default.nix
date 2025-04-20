{
  system = "x86_64-linux";
  user = "yuna";
  repo = "/mnt/share/.nix";

  modules = options:
    with options; [
      ../../modules/nixos
      home-manager # refers to the correct home-manager module with preconfigured flake inputs
      ../../modules/home-manager
      ../../modules/common/homebrew.nix
    ];
}
