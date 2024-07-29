{
  pkgs,
  home,
  repo,
  user,
  ...
}: {
  # yubook does not have touchid :(
  security.useTouchId = false;

  home-manager.users.${user} = {
    home = {
      shellAliases = {
        # code = "env VSCODE_CWD=\"$PWD\" open -n -b \"com.microsoft.VSCode\" --args $*"; # create a shell alias for vs code
      };

      packages = with pkgs; [
        bclm
        imagemagick
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
          IdentityFile ~/.ssh/dev_bricksoft
          IdentityFile ~/.ssh/dev_ravpower
          IdentityFile ~/.ssh/dev_homebridge

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
        "ssh-keys/devs/bricksoft" = {
          path = "${home}/.ssh/dev_bricksoft";
        };
        "ssh-keys/devs/ravpower" = {
          path = "${home}/.ssh/dev_ravpower";
        };
        # "ssh-keys/devs/yubook" = {
        #   path = "${home}/.ssh/dev_yubook";
        #   sopsFile = ../../secrets/yubook.yaml;
        # };
      };
    };
  };
}
