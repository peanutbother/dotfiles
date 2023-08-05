{ pkgs, inputs, lib, system, stateVersion, ... }:
let
  user = "yuna";
in
{

  users.users.${user} = {
    name = user;
    home = "/Users/${user}";
  };

  home-manager.useGlobalPkgs = true;
  # home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {
    inherit inputs system stateVersion;
  };
  home-manager.sharedModules = [
    ./apps.nix
  ];

  home-manager.users.${user} = import ./home.nix;
}
