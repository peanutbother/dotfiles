rec {
  system = "x86_64-linux";
  user = "deck";
  repo = "/home/${user}/.nix";

  modules = options:
    with options; [
      ../../modules/steamos
      home-manager #  refers to the correct home-manager module with preconfigured flake inputs
      ../../modules/home-manager
      ../../modules/common/homebrew.nix
    ];
}
