{lib, ...}: let
  default_true = lib.mkDefault true;
  default_false = lib.mkDefault false;
in {
  programs.moonlight = {
    enable = default_true;
    configs.stable = {
      extensions = {
        betterCodeblocks.enabled = default_true;
        betterEmbedsYT = {
          enabled = default_true;
          config = {
            fullDescription = default_false;
            expandDescription = default_true;
          };
        };
        disableSentry.enabled = default_true;
        inAppNotifications.enabled = default_true;
        mediaControls.enabled = default_true;
        moonbase.enabled = default_true;
        noTrack.enabled = default_true;
        spotifySpoof.enabled = default_true;
        whosWatching.enabled = default_true;
      };
    };
  };
}
