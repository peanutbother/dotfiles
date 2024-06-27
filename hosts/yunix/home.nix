{ inputs, pkgs, home, repo, user, ... }: {
  users.users.${user} = {
    isNormalUser = true;
    initialPassword = "login";
    group = "users";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  home-manager.users.${user} = {

    home = {
      file = {
        ".config/latte" = {
          source = ../../modules/home-manager/dotfiles/latte-dock;
          recursive = true;
        };
        ".config/mpv" = {
          source = ../../modules/home-manager/dotfiles/mpv;
          recursive = true;
        };
        ".ssh" = {
          source = ../../modules/home-manager/dotfiles/ssh;
          recursive = true;
        };
      };

      packages = with pkgs; [
        # *nix packages
        armcord
        krita
        kdeconnect
        latte-dock
        pciutils
        networkmanager
        #plasma5Packages.plasma-browser-integration # currently incompatible with vivaldi
        putty
        signal-desktop-beta
        spectacle
        telegram-desktop
        vivaldi
      ];
    };

    programs = {
      alacritty = {
        settings.font.size = 10;
      };

      git = {
        userName = "peanutbother";
        userEmail = "peanutbother@proton.me";
      };

      plasma = {
        enable = true;
        configFile = {
          "kdeglobals"."KFileDialog Settings"."Show hidden files" = true;
          "kdeglobals"."KScreen"."ScaleFactor" = 1.5;
          "kdeglobals"."KScreen"."ScreenScaleFactors" = "eDP-1=1.5;DP-1=1.5;HDMI-1=1.5;DP-2=1.5;HDMI-2=1.5;";
          "kiorc"."Confirmations"."ConfirmDelete" = false;
          "ksplashrc"."KSplash"."Engine" = "none";
          "plasma-localerc"."Formats"."LANG" = "en_GB.UTF-8";
        };
      };

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
        "ssh-keys/devs/yunix" = {
          path = "${home}/.ssh/dev_yunix";
          sopsFile = ../../secrets/yunix.yaml;
        };
      };
    };
  };
}
