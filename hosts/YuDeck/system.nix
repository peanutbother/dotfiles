{
  # config,
  inputs,
  # pkgs,
  ...
}: {
  system.stateVersion = "23.05";

  imports = [
    inputs.sops-nix.nixosModules.default
    inputs.jovian-nixos.nixosModules.default
  ];
}
