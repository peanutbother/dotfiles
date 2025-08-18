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
  users.users.${user} = {
    inherit home;
    name = user;
  };

  home-manager = {
    useGlobalPkgs = lib.mkDefault true;
    useUserPackages = lib.mkDefault true;
    extraSpecialArgs = {
      inherit repo user host home inputs stateVersion system;
    };
    sharedModules = with inputs;
      [
        mac-app-util.homeManagerModules.default # link nix apps to darwin (fix spotlight, dock)
        moonlight.homeModules.default
        sops-nix.homeManagerModule
        spicetify-nix.homeManagerModules.default
      ]
      ++ (lib.optionals (!pkgs.stdenv.hostPlatform.isDarwin) [
        inputs.plasma-manager.homeManagerModules.plasma-manager
      ]);
  };

  imports = [
    ./home.nix # common home config
  ];
}
