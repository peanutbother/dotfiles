inputs: [
  (import ./aldente.nix)
  (import ./alt-tab-macos.nix)
  (import ./bclm)
  (import ./cht-sh)
  (import ./keka.nix)
  (import ./plymouth)
  (import ./rectangle.nix)
  (import ./sddm)
  (import ./spicetify.nix inputs)
  (import ./vivaldi.nix)
  inputs.vscode-extensions.overlays.default
]
