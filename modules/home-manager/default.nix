{ host, repo, user }: { inputs, lib, pkgs, system, stateVersion, ... }:
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
    inputs.mac-app-util.homeManagerModules.default # link apps to fix spotlight and dock on darwin
    inputs.sops-nix.homeManagerModule
  ] ++ (if !pkgs.stdenv.hostPlatform.isDarwin then [
    inputs.plasma-manager.homeManagerModules.plasma-manager
    inputs.spicetify-nix.homeManagerModule
  ] else [ ]);

  # common home config
  home-manager.users.${user} = import ./home.nix { inherit repo; };

  # host specific home config
  imports = [
    (import ../../hosts/${host}/home.nix { inherit home repo; })
  ];
}
