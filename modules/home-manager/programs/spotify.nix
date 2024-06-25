{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.dribbblish;
    colorScheme = "rosepine";
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      history
      lastfm
      powerBar
      playNext
      savePlaylists
    ];
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
      newReleases
      {
        name = "combined-playlists";
        src = builtins.fetchGit {
          url = "https://github.com/jeroentvb/spicetify-combined-playlists";
          rev = "fc2589ad83ea069035af0b0e1544a9688b871566";
          ref = "dist";
        };
      }
    ];
  };
}
