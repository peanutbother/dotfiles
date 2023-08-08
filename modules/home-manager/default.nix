{ pkgs, inputs, lib, system, sops-nix, stateVersion, ... }:
let
  user = "yuna";
  home = "/Users/${user}";
in
{
  users.users.${user} = {
    inherit home;
    name = user;
  };

  home-manager.useGlobalPkgs = true;
  # home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {
    inherit home inputs stateVersion system;
  };
  home-manager.sharedModules = [
    ./apps.nix
    sops-nix.homeManagerModule
  ];

  home-manager.users.${user} = import ./home.nix;
}
