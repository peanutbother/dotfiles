inputs: stateVersion: rec {
  eachSystem = f:
    let
      # Merge together the outputs for all systems.
      op = attrs: system:
        let
          ret = f system;
          op = attrs: key: attrs //
            {
              ${key} = (attrs.${key} or { })
                // { ${system} = ret.${key}; };
            }
          ;
        in
        builtins.foldl' op attrs (builtins.attrNames ret);
    in
    builtins.foldl' op { } [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ]
  ;

  mkSystem = host: darwin: (import ./modules/${if darwin then "darwin" else "nixos"});
  mkHome = host: darwin: { user, repo }: {
    imports = [
      (if darwin then inputs.home-manager.darwinModules.default else inputs.home-manager.nixosModules.default)
      (import ./modules/home-manager { inherit user repo; })
    ];
  };

  homebrew = darwin: { user, options ? { } }: (import ./modules/homebrew.nix { inherit user options darwin; });

  mkModules = host: darwin: (import ./hosts/${host}
    {
      inherit inputs host;
      mkHome = mkHome host darwin;
      mkSystem = mkSystem host darwin;
      homebrew = homebrew darwin;
    });
  mkArgs = system: stateVersion: host: {
    inherit inputs system stateVersion host;
    overlays = import ./overlays inputs;
  };

  nixosSystem = { system, name }: inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    modules = mkModules name false;
    specialArgs = mkArgs system stateVersion name;
  };
  darwinSystem = { system, name }: inputs.darwin.lib.darwinSystem {
    inherit system;
    modules = (mkModules name true)
      # link nix apps to darwin (fix spotlight, dock)
      ++ [ inputs.mac-app-util.darwinModules.default ];
    specialArgs = mkArgs system stateVersion name;
  };
}
