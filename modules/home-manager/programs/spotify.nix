{ pkgs, inputs, ... }:
{
  programs.spicetify = with pkgs.spicetify; {
    enable = true;
    theme = themes.dribbblish;
    colorScheme = "rosepine";
    enabledExtensions = with extensions; [
      fullAppDisplay
      history
      lastfm
      powerBar
      playNext
      savePlaylists
    ];
    enabledCustomApps = with apps; [
      combinedPlaylists
      lyricsPlus
      newReleases
    ];
  };
}
