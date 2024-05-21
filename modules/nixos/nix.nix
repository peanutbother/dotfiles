{ lib, ... }: {
  nix = {
    # enable garbage collection
    gc = {
      dates = "weekly";
    };
  };

  imports = [
    ../common/nix
  ];
}
