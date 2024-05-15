{
  description = "nix-conf";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-23.11-darwin";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
      inputs.nix-darwin.follows = "darwin";
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mkAlias = {
      url = "github:reckenrode/mkAlias";
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
      url = "github:peanutbother/spicetify-nix";
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

  outputs = inputs:
    let
      stateVersion = "23.11";
      utils = (import ./util.nix) inputs stateVersion;
    in
    {
      # system configs
      nixosConfigurations.yunix = utils.nixosSystem {
        name = "yunix";
        system = "x86_64-linux";
      };

      darwinConfigurations.yubook = utils.darwinSystem {
        name = "yubook";
        system = "x86_64-darwin";
      };

      darwinConfigurations.YunAir = utils.darwinSystem {
        name = "YunAir";
        system = "aarch64-darwin";
      };

      # templates
      templates = {
        embedded = {
          description = "embedded development environment";
          path = ./templates/embedded;
        };
        nix = {
          description = "nix development environment";
          path = ./templates/nix;
        };
        rust = {
          description = "rust development environment";
          path = ./templates/rust;
        };
        rust-nix = {
          description = "rust development environment with nix flake";
          path = ./templates/rust-nix;
        };
        typescript = {
          description = "typescript development environment";
          path = ./templates/typescript;
        };
      };
    }
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
