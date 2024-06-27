{
  home,
  lib,
  ...
}: {
  sops = {
    defaultSopsFile = ../../../secrets/common.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = lib.mkDefault "${home}/.nix/secrets/keys.txt";
  };
}
