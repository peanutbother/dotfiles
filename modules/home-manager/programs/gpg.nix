{ lib, ... }: {
  programs.gpg = {
    enable = true;
    mutableKeys = lib.mkDefault true;
    mutableTrust = lib.mkDefault true;
    publicKeys = [
      # "4515F50492954AFF325F759C18A1380ED4E7FC0D" # izzie
    ];
  };
}
