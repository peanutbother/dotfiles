{
  inputs,
  lib,
  pkgs,
  system,
  stateVersion,
  host,
  home,
  user,
  repo,
  ...
}: {
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
      inputs.mac-app-util.homeManagerModules.default # link nix apps to darwin (fix spotlight, dock)
      inputs.sops-nix.homeManagerModule
      inputs.spicetify-nix.homeManagerModules.default
    ]
    ++ (lib.optionals (!pkgs.stdenv.hostPlatform.isDarwin) [
      inputs.plasma-manager.homeManagerModules.plasma-manager
    ]);

  imports = [
    ./home.nix # common home config
  ];
}
