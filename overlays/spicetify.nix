inputs: final: prev: {
  spicetify =
    let
      spicetify = inputs.spicetify-nix.legacyPackages.${final.system};
    in
    spicetify // {
      apps = spicetify.apps // {
        combinedPlaylists = {
          name = "combined-playlists";
          src = builtins.fetchGit {
            url = "https://github.com/jeroentvb/spicetify-combined-playlists";
            rev = "fc2589ad83ea069035af0b0e1544a9688b871566";
            ref = "dist";
          };
        };
      };
    };
}
