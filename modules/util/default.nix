inputs: stateVersion:
with inputs.nixpkgs; let
  args = {
    inherit inputs stateVersion;
    inherit (inputs.dotdev.lib.common) eachDefaultFolder filesInPath eachSystem eachSystemWithPkgs mkShell;
  };
in
  {
    inherit (inputs.dotdev) checks devShells formatter lib;
  }
  // (import ./hosts.nix args)
