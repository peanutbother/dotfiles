{
  darwin,
  user,
  options,
}: {
  imports = [
    (
      {
        lib,
        inputs,
        ...
      }: let
        nix-homebrew =
          if darwin
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
              // options;
          }
        ];
      }
    )
  ];
}
