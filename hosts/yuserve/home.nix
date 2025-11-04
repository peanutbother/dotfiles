{
  pkgs,
  home,
  repo,
  user,
  ...
}: {
  users.users.${user} = {
    isNormalUser = true;
    group = "users";
    extraGroups = ["wheel"];
  };
  home-manager.users.${user} = {
    home = {
      packages = with pkgs; [
        docker
        docker-compose
      ];
    };

    programs = {
      alacritty.enable = false;
      moonlight.enable = false;
      spicetify.enable = false;
      vscode.enable = false;
      yt-dlp.enable = false;

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
