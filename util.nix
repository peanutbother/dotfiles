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

  mkSystem = host: { darwin ? false }:
    if darwin then mkDarwinSystem host else mkNixSystem host;
  mkDarwinSystem = host: (import ./modules/darwin { inherit host; });
  mkNixSystem = host: (import ./modules/nixos { inherit host; });
  mkHome = host: { user, repo }: (import ./modules/home-manager { inherit host user repo; });

  mkModules = host: (import ./hosts/${host}
    {
      inherit inputs host;
      mkHome = mkHome host;
      mkSystem = mkSystem host;
    });
  mkArgs = system: stateVersion: host: {
    inherit inputs system stateVersion host;
    overlays = import ./overlays;
  };

  nixosSystem = { system, name }: inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    modules = mkModules name;
    specialArgs = mkArgs system stateVersion name;
  };
  darwinSystem = { system, name }: inputs.darwin.lib.darwinSystem {
    inherit system;
    modules = mkModules name;
    specialArgs = mkArgs system stateVersion name;
  };
}
