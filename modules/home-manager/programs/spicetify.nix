{
  pkgs,
  lib,
  ...
}: {
  programs.spicetify = with pkgs.spicetify; {
    enable = lib.mkDefault true;
    theme = lib.mkDefault themes.ziro;
    colorScheme = lib.mkDefault "purple-dark";
    enabledExtensions = with extensions;
      lib.mkDefault [
        fullAppDisplay
        history
        lastfm
        powerBar
        playNext
        savePlaylists
      ];
    enabledCustomApps = with apps;
      lib.mkDefault [
        combinedPlaylists
        lyricsPlus
        newReleases
        reddit
      ];
  };
}
