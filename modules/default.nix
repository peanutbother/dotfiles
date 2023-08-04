{ home-manager, ... }: [
  ./darwin
  ./darwin/apps.nix
  home-manager.darwinModule
  (import ./home-manager)

  #   spicetify.nixosModule
  #   {
  #     nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  #       "spotify"
  #     ];
  #     programs.spicetify = {
  #       enable = true;
  #       # windowManagerPatch = false;
  #       # spotifyPackage = nixpkgs.spotify;
  #       enabledCustomApps = with spicePkgs.apps; [
  #         new-releases
  #         lyrics-plus
  #         localFiles
  #         marketplace
  #       ];

  #       enabledExtensions = with spicePkgs.extensions; [
  #         adblock
  #         fullAlbumDate
  #         groupSession
  #         history
  #         showQueueDuration
  #         lastFm
  #         playNext
  #         shuffle
  #       ];
  #     };
  #     }
]
