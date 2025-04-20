inputs: final: _: {
  spicetify = let
    spicetify = inputs.spicetify-nix.legacyPackages.${final.system};
  in
    spicetify
    // {
      apps =
        spicetify.apps
        // {
          combinedPlaylists = {
            name = "combined-playlists";
            src = builtins.fetchGit {
              url = "https://github.com/jeroentvb/spicetify-combined-playlists";
              rev = "ee3414d198e1aad5ad41f96fe2745bb04886d25f";
              ref = "dist";
            };
          };
        };
    };
}
