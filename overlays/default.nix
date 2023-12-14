[
  (import ./bclm)
  (import ./cht-sh)
  (import ./direnv.nix)
  (import ./plymouth)
  (import ./sddm)
  (import ./vivaldi.nix)
  (import (builtins.fetchGit {
    url = "https://github.com/nix-community/nix-vscode-extensions";
    ref = "refs/heads/master";
    rev = "edf4473be9f0becf2567db862b1d2fe7075de41c";
  })).overlays.default
]
