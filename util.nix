inputs: stateVersion: rec {
  eachSystem = f: let
    # Merge together the outputs for all systems.
    op = attrs: system: let
      ret = f system;
      op = attrs: key:
        attrs
        // {
          ${key} =
            (attrs.${key} or {})
            // {${system} = ret.${key};};
        };
    in
      builtins.foldl' op attrs (builtins.attrNames ret);
  in
    builtins.foldl' op {} [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];

  mkConfiguration = {
    type,
    name,
    system,
    config,
  }:
    if type == "darwin"
    then {
      darwinConfigurations.${name} = darwinSystem {
        inherit name system config;
      };
    }
    else if type == "nixos"
    then {
      nixosConfigurations.${name} = nixosSystem {
        inherit name system config;
      };
    }
    else throw "invalid type ${type}";

  eachDefaultFolder = dir:
    inputs.nixpkgs.lib.mapAttrs (name: _: import (dir + "/${name}"))
    (builtins.readDir dir);

  mkConfigurations = path:
    builtins.foldl' (acc: elem: {
      darwinConfigurations = acc.darwinConfigurations or {} // elem.darwinConfigurations or {};
      nixosConfigurations = acc.nixosConfigurations or {} // elem.nixosConfigurations or {};
    }) {} (builtins.attrValues (inputs.nixpkgs.lib.mapAttrs
      (name: value:
        with value;
          mkConfiguration {
            inherit type name system config;
          })
      (eachDefaultFolder path)));

  mkSystem = host: darwin: (import
    ./modules/${
      if darwin
      then "darwin"
      else "nixos"
    });
  mkHome = host: darwin: {
    user,
    repo,
  }: {
    imports = [
      (mkSystem host darwin)
      (
        if darwin
        then inputs.home-manager.darwinModules.default
        else inputs.home-manager.nixosModules.default
      )
      (import ./modules/home-manager {inherit user repo;})
    ];
  };

  homebrew = darwin: {
    user,
    options ? {},
  }: (import ./modules/homebrew.nix {inherit user options darwin;});

  mkModules = host: darwin: config: (config
    {
      inherit inputs host;
      mkHome = mkHome host darwin;
      homebrew = homebrew darwin;
    });
  mkArgs = system: stateVersion: host: {
    inherit inputs system stateVersion host;
    overlays = import ./overlays inputs;
  };

  nixosSystem = {
    system,
    name,
    config,
  }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = mkModules name false config;
      specialArgs = mkArgs system stateVersion name;
    };
  darwinSystem = {
    system,
    name,
    config,
  }:
    inputs.nix-darwin.lib.darwinSystem {
      inherit system;
      modules =
        (mkModules name true config)
        # link nix apps to darwin (fix spotlight, dock)
        ++ [inputs.mac-app-util.darwinModules.default];
      specialArgs = mkArgs system stateVersion name;
    };
}
