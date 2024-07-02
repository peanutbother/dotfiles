inputs: stateVersion:
with inputs.nixpkgs; let
  # map each subfolder of given `path` with a `default.nix` to an attribute name with its exports
  eachDefaultFolder = path: lib.mapAttrs (name: _: import (path + "/${name}")) (lib.filterAttrs (_: d: d == "directory") (builtins.readDir path));

  # map files in a path to a list
  filesInPath = path: builtins.attrNames (builtins.readDir path);

  # map an expression to each system attribute
  eachSystem = fn:
    lib.genAttrs [
      "aarch64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
      "x86_64-linux"
    ] (system: fn system);

  args = {inherit inputs stateVersion eachDefaultFolder filesInPath eachSystem;};
in
  {}
  // (import ./hosts.nix args)
  // (import ./shells.nix args)
