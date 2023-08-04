{ home-manager, ... }: [
  ./darwin
  ./darwin/apps.nix
  home-manager.darwinModule
  (import ./home-manager)
]
