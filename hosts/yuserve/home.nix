{
  pkgs,
  home,
  repo,
  user,
  ...
}: {
  home-manager.users.${user} = {
    home = {
      packages = with pkgs; [
        docker
        docker-compose
      ];
    };

    programs = {
      git = {
        userName = "peanutbother";
        userEmail = "peanutbother@proton.me";
      };

      ssh.extraConfig = ''
        Host *
          UseKeychain yes
          AddKeysToAgent yes

        Host *.github.com
          AddKeysToAgent yes
          UseKeychain yes
          IdentityFile ~/.ssh/github_peanutbother
      '';

      zoxide.prefix = "cd";
    };

    sops = {
      age.keyFile = "${repo}/secrets/keys.txt";
      secrets = {
        "ssh-keys/git/peanutbother" = {
          path = "${home}/.ssh/github_peanutbother";
        };
      };
    };
  };
}
