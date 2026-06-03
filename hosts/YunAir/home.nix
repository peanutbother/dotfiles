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
        alcove
        aldente
        dockdoor
        raycast
        rectangle
        docker
        ice-bar
        imagemagick
        istat-menus
        keka
        #moonlight
        discord
        nix-auth
        nixd
        ntfs3g # required for mounty
        signal-desktop
        tailscale
        telegram-desktop
        testdisk
        utm
        vlc-bin
      ];
    };

    programs = {
      git.settings = {
        user = {
          name = "peanutbother";
          email = "peanutbother@proton.me";
        };
      };

      vscode.enable = false;

      ssh.extraConfig = ''
        Host *
          IgnoreUnknown UseKeychain
          AddKeysToAgent yes
          UseKeychain yes
          IdentityFile ~/.ssh/dev_bricksoft
          IdentityFile ~/.ssh/dev_lxc
          IdentityFile ~/.ssh/dev_pve
          IdentityFile ~/.ssh/dev_ravpower
          IdentityFile ~/.ssh/dev_yudeck

        Host *.github.com
          IgnoreUnknown UseKeychain
          AddKeysToAgent yes
          UseKeychain yes
          IdentityFile ~/.ssh/github_peanutbother

        Host *.lab
          IgnoreUnknown UseKeychain
          AddKeysToAgent yes
          UseKeychain yes
          IdentityFile ~/.ssh/dev_lxc
          USER root

        Host 10.95.0.*
          IgnoreUnknown UseKeychain
          AddKeysToAgent yes
          UseKeychain yes
          IdentityFile ~/.ssh/dev_lxc
          USER root
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
        "ssh-keys/devs/lxc" = {
          path = "${home}/.ssh/dev_lxc";
          sopsFile = ../../secrets/YunAir.yaml;
        };
        "ssh-keys/devs/pve" = {
          path = "${home}/.ssh/dev_pve";
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
