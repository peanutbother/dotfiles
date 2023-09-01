{ home, ... }: {
  sops = {
    defaultSopsFile = ../../../secrets/common.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "${home}/.nix/secrets/keys.txt";
  };
}
