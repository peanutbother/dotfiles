inputs: [
  (import ./aldente.nix)
  (import ./bclm)
  (import ./cht-sh)
  (import ./keka.nix)
  (import ./plymouth)
  (import ./sddm)
  (import ./spicetify.nix inputs)
  (import ./unstable.nix inputs)
  (import ./vivaldi.nix)
  inputs.vscode-extensions.overlays.default
]
