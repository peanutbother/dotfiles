{ host, user }: { inputs, pkgs, system, stateVersion, ... }:
let
  home = if pkgs.stdenv.hostPlatform.isDarwin then "/Users/${user}" else "/home/${user}";
in
{
  programs.zsh.enable = true;
  users.users.${user} = {
    inherit home;
    name = user;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.extraSpecialArgs = {
    inherit home inputs stateVersion system;
  };
  home-manager.sharedModules = [
    ./apps.nix
    inputs.sops-nix.homeManagerModule
  ];

  home-manager.users.${user} = import ./home.nix;

  imports = [
    ../hosts/${host}/home.nix
  ];
}
