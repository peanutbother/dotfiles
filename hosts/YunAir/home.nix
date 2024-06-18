{ home, repo }: { pkgs, ... }:
let
  user = "yuna";
in
{
  home-manager.users.${user} = {
    home = {
      file = {
        ".ssh" = {
          source = ../../modules/home-manager/dotfiles/ssh;
          recursive = true;
        };
      };
      shellAliases = {
        # code = "env VSCODE_CWD=\"$PWD\" open -n -b \"com.microsoft.VSCode\" --args $*"; # create a shell alias for vs code
      };

      sessionPath = [
        "$HOME/.spicetify" # TODO needs to be manually installed as of now (spicetify-nix is incompatible with darwin)
      ];

      packages = with pkgs;[
        unstable.aldente
        unstable.raycast
        alt-tab-macos
        docker
        imagemagick
        keka
        ntfs3g # required for mounty
        rectangle
      ];
    };

    programs = {
      git = {
        userName = "peanutbother";
        userEmail = "peanutbother@proton.me";
      };

      vscode.enable = false;

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
        "ssh-keys/devs/homebridge" = {
          path = "${home}/.ssh/dev_homebridge";
        };
        "ssh-keys/devs/YunAir" = {
          path = "${home}/.ssh/dev_yunair";
          sopsFile = ../../secrets/YunAir.yaml;
        };
      };
    };
  };
}
