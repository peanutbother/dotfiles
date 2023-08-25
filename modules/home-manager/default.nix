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
    inherit home inputs stateVersion system;
  };
  home-manager.sharedModules = [
    ./apps.nix
    inputs.sops-nix.homeManagerModule
  ];

  home-manager.users.${user} = import ./home.nix;

  imports = [
    ../../hosts/${host}/home.nix
  ];
}
