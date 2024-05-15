[
  (import ./bclm)
  (import ./cht-sh)
  (import ./direnv.nix)
  (import ./plymouth)
  (import ./sddm)
  (import ./vivaldi.nix)
  (import (builtins.fetchGit {
    url = "https://github.com/nix-community/nix-vscode-extensions";
    ref = "master";
    rev = "5426ecc8a714c6986383511fbe6c79eca1981d02";
  })).overlays.default
]
