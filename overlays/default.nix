inputs: [
  (import ./bclm)
  (import ./cht-sh)
  (import ./direnv.nix)
  (import ./plymouth)
  (import ./sddm)
  (import ./vivaldi.nix)
  inputs.vscode-extensions.overlays.default
]
