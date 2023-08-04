{ pkgs, inputs, lib, system, ... }:
let
  user = "yuna";
in
{
  nixpkgs.overlays = import ../../overlays;

  users.users.${user} = {
    name = user;
    home = "/Users/${user}";
  };

  home-manager.useGlobalPkgs = true;
  # home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {
    inherit inputs system;
  };
  home-manager.sharedModules = [
    ./apps.nix
  ];

  home-manager.users.${user} = import ./home.nix;
}
