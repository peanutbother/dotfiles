{ lib, pkgs, stateVersion, ... }: {
  home = {
    inherit stateVersion;

    packages = with pkgs; [
      # common packages
      age
      asciinema
      curl
      less
      mc
      neofetch
      progress
      sops
      tmuxinator
      wget
      yt-dlp
    ];

    sessionVariables = {
      HOMEBREW_NO_ANALYTICS = lib.mkDefault 1; # disable homebrew analytics
      PAGER = lib.mkDefault "less"; # use less instead of more
      COLOR = lib.mkDefault 1; # force cli color
      CLICOLOR = lib.mkDefault 1; # force cli color
      EDITOR = lib.mkDefault "code --wait"; # on darwin requires alias `code` from `shellAliases.code` below
    };

    sessionPath = [
      "$HOME/.spicetify" # TODO needs to be manually installed as of now (incompatible with macos)
    ];

    shellAliases = {
      sudo = "sudo "; # allow aliases to be run with sudo
      nixup = "pushd ~/.nix; nix flake update; nixswitch; popd"; # update nix env and refresh
      cls = "clear"; # shorthand and alias to win's cls
      mux = "tmuxinator"; # create a shell alias for tmuxinator
      lsd = "ls -TaI .git --git-ignore";
      # get_idf = ". $HOME/esp/esp-idf/export.sh"                                     # TODO install esp-idf somehow
    };
  };

  imports = [
    ./dotfiles # copy dotfiles into home
    ./programs # install and configure applications using home-manager
  ];
}
