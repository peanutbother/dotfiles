{
  # enable flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # allow proprietary software
  nixpkgs.config.allowUnfree = true;

  # activate nix daemon
  services.nix-daemon.enable = true;
}
