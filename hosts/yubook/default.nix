{
  system = "x86_64-darwin";
  user = "yuna";
  repo = "/Volumes/Share/.nix";

  # optionally override modules
  # modules = {inputs, home-manager}: [
  #   ../../modules/darwin
  #   home-manager # refers to the correct home-manager module
  #   ../../modules/home-manager
  #   ../../modules/common/homebrew.nix
  # ];
}
