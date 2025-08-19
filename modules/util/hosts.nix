{
  eachDefaultFolder,
  inputs,
  stateVersion,
  ...
}:
with inputs.nixpkgs; rec {
  mkHosts = path:
    builtins.foldl' (acc: elem: {
      darwinConfigurations = acc.darwinConfigurations or {} // elem.darwinConfigurations or {};
      nixosConfigurations = acc.nixosConfigurations or {} // elem.nixosConfigurations or {};
    }) {} (
      builtins.attrValues (lib.mapAttrs mkHost (eachDefaultFolder path))
    );

  mkHost = hostName: config: let
    system =
      if lib.hasSuffix "darwin" config.system
      then "darwin"
      else if lib.hasSuffix "linux" config.system
      then "nixos"
      else throw "invalid system ${config.system}";
  in {
    ${system + "Configurations"}.${hostName} =
      if system == "darwin"
      then mkDarwinSystem hostName config
      else mkNixosSystem hostName config;
  };

  mkDarwinSystem = host: {
    homebrewOptions ? {},
    modules ? null,
    repo,
    system,
    user,
    ...
  }:
    inputs.nix-darwin.lib.darwinSystem {
      inherit system;
      modules = mkModules {inherit user host modules;} true;
      specialArgs = mkArgs {
        inherit homebrewOptions host repo system user;
        isDarwin = true;
      };
    };

  mkNixosSystem = host: {
    system,
    user,
    repo,
    modules ? null,
    homebrewOptions ? {},
    ...
  }:
    lib.nixosSystem {
      inherit system;
      modules = mkModules {inherit user host modules;} false;
      specialArgs = mkArgs {
        inherit system user repo host homebrewOptions;
        isDarwin = false;
      };
    };

  # generate list of default modules loaded in nix config for host
  mkModules = {
    host,
    modules,
    user,
  }: isDarwin: let
    home-manager = with inputs.home-manager;
      if isDarwin
      then darwinModules.default
      else nixosModules.default;
    system-modules =
      ../${
        if isDarwin
        then "darwin"
        else "nixos"
      };
  in
    if builtins.isNull modules
    then [
      system-modules
      home-manager
      ../home-manager
      ../common/homebrew.nix
    ]
    else modules {inherit inputs home-manager user host;};

  # used for global args in `pkgs.callPackage`
  mkArgs = {
    homebrewOptions,
    host,
    isDarwin,
    repo,
    system,
    user,
  }: let
    home =
      if isDarwin
      then "/Users/${user}"
      else "/home/${user}";
  in {
    inherit inputs home homebrewOptions host isDarwin repo stateVersion system user;
    overlays = import ../../overlays inputs;
  };
}
