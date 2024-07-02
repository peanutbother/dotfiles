{
  inputs,
  eachSystem,
  filesInPath,
  ...
} @ args:
with inputs.nixpkgs; rec {
  mkShells = path: {devShells = eachSystem (system: builtins.foldl' (acc: elem: acc // (mkShell path elem system)) {} (filesInPath path));};

  mkShell = path: name: (system: {
    ${lib.removeSuffix ".nix" name} = import (path + "/${name}") args system;
  });
}
