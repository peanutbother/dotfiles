{ home-manager, ... }: [
  ./darwin
  home-manager.darwinModule
  (import ./home-manager)
]
