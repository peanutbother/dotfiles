{ lib, ... }: {
  programs.gpg = {
    enable = true;
    mutableKeys = lib.mkDefault true;
    mutableTrust = lib.mkDefault true;
    publicKeys = [
      { source = ./keys/izzie.gpg; trust = "full"; } # izzie
    ];
  };
}
