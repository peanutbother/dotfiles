{
  home,
  pkgs,
  repo,
  user,
  ...
}: {
  home-manager.users.${user} = {
    home = {
      shellAliases = {
        # code = "env VSCODE_CWD=\"$PWD\" open -n -b \"com.microsoft.VSCode\" --args $*"; # create a shell alias for vs code
      };

      packages = with pkgs; [
        aldente
        raycast
        rectangle
        alt-tab-macos
        docker
        ice-bar
        imagemagick
        istat-menus
        keka
        moonlight
        nix-auth
        ntfs3g # required for mounty
        signal-desktop-bin
        tailscale
        telegram-desktop
        testdisk
        utm
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
          IdentityFile ~/.ssh/dev_homebridge
          IdentityFile ~/.ssh/dev_lxc
          IdentityFile ~/.ssh/dev_ravpower
          IdentityFile ~/.ssh/dev_yudeck

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
        "ssh-keys/devs/homebridge" = {
          path = "${home}/.ssh/dev_homebridge";
        };
        "ssh-keys/devs/lxc" = {
          path = "${home}/.ssh/dev_lxc";
          sopsFile = ../../secrets/YunAir.yaml;
        };
        "ssh-keys/devs/ravpower" = {
          path = "${home}/.ssh/dev_ravpower";
        };
        "ssh-keys/devs/YunAir" = {
          path = "${home}/.ssh/dev_yunair";
          sopsFile = ../../secrets/YunAir.yaml;
        };
        "ssh-keys/devs/YuDeck" = {
          path = "${home}/.ssh/dev_yudeck";
          sopsFile = ../../secrets/YunAir.yaml;
        };
      };
    };
  };
}
