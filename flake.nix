{
  description = "nix-conf";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-23.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    mac-app-util.url = "github:hraban/mac-app-util";

    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
      inputs.nix-darwin.follows = "nix-darwin";
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    embedded_shell = {
      url = "github:peanutbother/dotfiles?dir=shells/embedded";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix_shell = {
      url = "github:peanutbother/dotfiles?dir=shells/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust_shell = {
      url = "github:peanutbother/dotfiles?dir=shells/rust";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    web_shell = {
      url = "github:peanutbother/dotfiles?dir=shells/web";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: let
    stateVersion = "23.11";
    utils = (import ./util.nix) inputs stateVersion;
  in
    {
      description = "A flake with utils, configurations and templates to build convenient environments";
      formatter = inputs.nixpkgs.alejandra;
    }
    // import ./templates
    // utils.mkConfigurations ./hosts
    // utils.eachSystem (system: {
      # shells
      devShells = {
        embedded = inputs.embedded_shell.devShells.${system}.default;
        nix = inputs.nix_shell.devShells.${system}.default;
        rust = inputs.rust_shell.devShells.${system}.default;
        web = inputs.web_shell.devShells.${system}.default;
      };
    });
}
