{ home, ... }: {
  sops = {
    defaultSopsFile = ../../../secrets/yuna.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "${home}/.config/sops/age/keys.txt";

    secrets = {
      "ssh-keys/git/peanutbother" = {
        path = "${home}/.ssh/github_peanutbother";
      };
      "ssh-keys/devs/ravpower" = {
        path = "${home}/.ssh/dev_ravpower";
      };
    };
  };
}
