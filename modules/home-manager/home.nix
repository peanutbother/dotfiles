{
  repo,
  user,
  host,
  config,
  lib,
  pkgs,
  stateVersion,
  ...
}: {
  home-manager.users.${user} = {
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
        (lib.mkIf config.programs.tmux.enable tmuxinator)
        wget
      ];

      sessionVariables = {
        HOMEBREW_NO_ANALYTICS = lib.mkDefault 1; # disable homebrew analytics
        PAGER = lib.mkDefault "less"; # use less instead of more
        COLOR = lib.mkDefault 1; # force cli color
        CLICOLOR = lib.mkDefault 1; # force cli color
        EDITOR = lib.mkDefault "code --wait";
      };

      shellAliases = let
        nixcmd =
          if pkgs.stdenv.hostPlatform.isDarwin
          then "nix run nix-darwin --"
          else "nixos-rebuild";
      in {
        sudo = "sudo "; # allow aliases to be run with sudo
        nixclean = "sudo nix-collect-garbage --delete-old"; # delete old generations
        nixswitch = "sudo -i ${nixcmd} switch --flake '${repo}/.#'"; # refresh nix env after config changes
        nixcheck = "sudo -i ${nixcmd} check --flake '${repo}/.#'"; # check nix config for errors
        nixup = "pushd ${repo}/; nix flake update; nixswitch; popd"; # update nix env and refresh
        cls = "clear"; # shorthand and alias to win's cls
        mux = lib.mkIf config.programs.tmux.enable "tmuxinator"; # create a shell alias for tmuxinator
        lsd = "ls -TaI .git --git-ignore";
        # get_idf = ". $HOME/esp/esp-idf/export.sh"                                     # TODO install esp-idf somehow
      };
    };

    imports = [
      ./dotfiles # copy dotfiles into home
      ./programs # install and configure applications using home-manager
    ];
  };
  imports = [
    ../../hosts/${host}/home.nix # host-specific home config
  ];
}
