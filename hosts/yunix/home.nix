{ home }: { inputs, pkgs, ... }:
let
  user = "yuna";
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
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
        ".ssh" = {
          source = ../../modules/home-manager/dotfiles/ssh;
          recursive = true;
        };
      };

      shellAliases = {
        nixswitch = "sudo nixos-rebuild switch --flake /mnt/share/.nix/.#"; # refresh nix env after config changes
        nixclean = "sudo nix-collect-garbage --delete-old"; # delete old generations
      };

      packages = with pkgs; [
        # *nix packages
        armcord
        krita
        kdeconnect
        latte-dock
        pciutils
        networkmanager
        plasma5Packages.plasma-browser-integration
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

      spicetify = {
        enable = true;
        theme = spicePkgs.themes.Bloom;
        enabledExtensions = with spicePkgs.extensions; [
          adblock
        ];
        enabledCustomApps = with spicePkgs.apps; [
          marketplace
          lyrics-plus
          {
            name = "combined-playlists";
            src = builtins.fetchGit {
              url = "https://github.com/jeroentvb/spicetify-combined-playlists";
              rev = "fc2589ad83ea069035af0b0e1544a9688b871566";
              ref = "dist";
            };
            appendName = true;
          }
        ];
      };
    };

    sops = {
      age.keyFile = "/mnt/share/.nix/secrets/keys.txt";
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
