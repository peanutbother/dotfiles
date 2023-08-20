{ home, ... }: {
  sops = {
    defaultSopsFile = ../../../secrets/yuna.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "${home}/.nix/secrets/keys.txt";

    secrets = {
      "ssh-keys/git/peanutbother" = {
        path = "${home}/.ssh/github_peanutbother";
      };
      "ssh-keys/devs/bricksoft" = {
        path = "${home}/.ssh/dev_bricksoft";
      };
      "ssh-keys/devs/ravpower" = {
        path = "${home}/.ssh/dev_ravpower";
      };
    };
  };
}
