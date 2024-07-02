{
  user,
  lib,
  inputs,
  homebrewOptions,
  isDarwin,
  ...
}:
if !isDarwin
then {}
else let
  nix-homebrew =
    if isDarwin
    then inputs.nix-homebrew.darwinModules.nix-homebrew
    else throw "homebrew not available for non-darwin";
in {
  imports = [
    nix-homebrew
    {
      nix-homebrew =
        {
          inherit user;

          enable = lib.mkDefault true;
          enableRosetta = lib.mkDefault true;
          mutableTaps = lib.mkDefault true;
          autoMigrate = lib.mkDefault true;

          taps = lib.mkDefault {
            "homebrew/homebrew-core" = inputs.homebrew-core;
            "homebrew/homebrew-cask" = inputs.homebrew-cask;
          };
        }
        // homebrewOptions;
    }
  ];
}
