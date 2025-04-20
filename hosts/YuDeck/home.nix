{
  pkgs,
  repo,
  user,
  ...
}: {
  users.users.${user} = {
    shell = pkgs.zsh;
  };

  home-manager.users.${user} = {
    # home = {
    #   file = {
    #     ".config/latte" = {
    #       source = ../../modules/home-manager/dotfiles/latte-dock;
    #       recursive = true;
    #     };
    #     ".config/mpv" = {
    #       source = ../../modules/home-manager/dotfiles/mpv;
    #       recursive = true;
    #     };
    #   };

    packages = with pkgs; [
      # *nix packages
      kdeconnect
      spectacle
      vivaldi
    ];
  };

  programs = {
    zoxide.prefix = "cd";
  };

  sops = {
    age.keyFile = "${repo}/secrets/keys.txt";
    secrets = {
    };
  };
}
