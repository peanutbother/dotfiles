{
  system,
  user,
  repo,
  modules ? {...}: [],
  config ? ({
    inputs,
    mkHome,
    ...
  }:
    [
      # home
      (mkHome {inherit user repo;})
    ]
    ++ (modules inputs)),
  ...
}: {
  inherit system config;
}
