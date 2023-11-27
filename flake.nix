{
  description = "nix-conf";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mkAlias = {
      url = "github:reckenrode/mkAlias";
      inputs.nixpkgs.follows = "nixpkgs";
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
      url = "path:./shells/embedded";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix_shell = {
      url = "path:./shells/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust_shell = {
      url = "path:./shells/rust";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    web_shell = {
      url = "path:./shells/web";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { darwin, nixpkgs, ... } @ inputs:
    let
      stateVersion = "23.05";
      mkModules = host: (import ./hosts/${host} { inherit inputs; });
      mkArgs = system: {
        inherit inputs system stateVersion;
        overlays = import ./overlays;
      };
    in
    {
      # system configs
      nixosConfigurations.yunix = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        modules = mkModules "yunix";
        specialArgs = mkArgs system;
      };

      darwinConfigurations.yubook = darwin.lib.darwinSystem rec {
        system = "x86_64-darwin";
        modules = mkModules "yubook";
        specialArgs = mkArgs system;
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
    // (import ./util.nix).eachSystem (system: {
      # shells
      devShells = {
        embedded = inputs.embedded_shell.devShells.${system}.default;
        nix = inputs.nix_shell.devShells.${system}.default;
        rust = inputs.rust_shell.devShells.${system}.default;
        web = inputs.web_shell.devShells.${system}.default;
      };
    });
}
