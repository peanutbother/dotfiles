rec {
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

  mkSystem = { host, darwin ? false }:
    if darwin then mkDarwinSystem host else mkNixSystem host;
  mkDarwinSystem = host: (import ./modules/darwin { inherit host; });
  mkNixSystem = host: (import ./modules/nixos { inherit host; });
  mkHome = { host, user, repo }: (import ./modules/home-manager { inherit host user repo; });
}
