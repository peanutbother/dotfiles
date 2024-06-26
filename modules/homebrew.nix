{ lib, nix-homebrew, user, inputs, options }: nix-homebrew
{
  nix-homebrew = {
    inherit user;

    enable = lib.mkdefault true;
    enableRosetta = lib.mkdefault true;
    mutableTaps = lib.mkdefault true;
    autoMigrate = lib.mkdefault true;

    taps = lib.mkDefault {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };
  } // options;
}
