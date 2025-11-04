inputs: [
  (import ./aldente.nix)
  (import ./alt-tab-macos.nix)
  (import ./cht-sh)
  (import ./keka.nix inputs)
  (import ./moonlight.nix inputs)
  (import ./nix-auth.nix inputs)
  (import ./plymouth)
  (import ./rectangle.nix)
  (import ./sddm)
  (import ./signal.nix)
  (import ./spicetify.nix inputs)
  (import ./vivaldi.nix)
  inputs.vscode-extensions.overlays.default
]
