{ host, user }: { inputs, lib, pkgs, system, stateVersion, ... }:
let
  home = if pkgs.stdenv.hostPlatform.isDarwin then "/Users/${user}" else "/home/${user}";
in
{
  programs.zsh.enable = lib.mkDefault true;
  users.users.${user} = {
    inherit home;
    name = user;
  };

  home-manager.useGlobalPkgs = lib.mkDefault true;
  home-manager.extraSpecialArgs = {
    inherit host home inputs stateVersion system;
  };
  home-manager.sharedModules = [
    ./apps.nix # link apps to fix spotlight on darwin
    inputs.sops-nix.homeManagerModule
  ];

  # common home config
  home-manager.users.${user} = import ./home.nix;

  # host specific home config
  imports = [
    (import ../../hosts/${host}/home.nix { inherit home; })
  ];
}
