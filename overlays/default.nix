inputs: [
  (import ./bclm)
  (import ./cht-sh)
  (import ./direnv.nix)
  (import ./plymouth)
  (import ./sddm)
  (import ./spicetify.nix inputs)
  (import ./unstable.nix inputs)
  (import ./vivaldi.nix)
  inputs.vscode-extensions.overlays.default
]
