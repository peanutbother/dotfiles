{ pkgs, lib, spicetify, ... }:
let
  spicePkgs = spicetify.pkgSets.${pkgs.system}.default;
in
{
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  # import the flake's module for your system
  imports = [ spicetify.homeManagerModule ];

  # configure spicetify :)
  programs.spicetify = {
    enable = true; # this is the line that will cause spotify to get installed
    # theme = spicePkgs.themes.Dribbblish;
    # colorScheme = "gruvbox";

    # enabledCustomApps = with spicePkgs.apps; [
    # new-releases
    # lyrics-plus
    # localFiles
    # marketplace
    # ];

    # enabledExtensions = with spicePkgs.extensions; [
    # adblock
    # fullAlbumDate
    # groupSession
    # history
    # showQueueDuration
    # lastFm
    # playNext
    # shuffle
    # ];
  };
}
