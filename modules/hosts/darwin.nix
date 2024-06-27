{
  system,
  user,
  repo,
  modules ? {...}: [],
  config ? ({
    inputs,
    mkHome,
    homebrew,
    ...
  }:
    [
      # homebrew
      (homebrew {inherit user;})

      # home
      (mkHome {inherit user repo;})
    ]
    ++ (modules inputs)),
  ...
}: {
  inherit system config;
}
