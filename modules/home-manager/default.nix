{
  repo,
  user,
}: {
  inputs,
  lib,
  pkgs,
  system,
  stateVersion,
  host,
  ...
}: let
  home =
    if pkgs.stdenv.hostPlatform.isDarwin
    then "/Users/${user}"
    else "/home/${user}";
in {
  programs.zsh.enable = lib.mkDefault true;
  users.users.${user} = {
    inherit home;
    name = user;
  };

  home-manager.useGlobalPkgs = lib.mkDefault true;
  home-manager.useUserPackages = lib.mkDefault true;
  home-manager.extraSpecialArgs = {
    inherit repo user host home inputs stateVersion system;
  };
  home-manager.sharedModules =
    [
      inputs.mac-app-util.homeManagerModules.default # link apps to fix spotlight and dock on darwin
      inputs.sops-nix.homeManagerModule
      inputs.spicetify-nix.homeManagerModules.default
      ./home.nix # common home config
      ../../hosts/${host}/home.nix # host-specific home config
    ]
    ++ (lib.optionals (!pkgs.stdenv.hostPlatform.isDarwin) [
      inputs.plasma-manager.homeManagerModules.plasma-manager
    ]);
}
