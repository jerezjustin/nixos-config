{
  description = "My NixOS Configuration.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;

      pkgs = import nixpkgs {
        system = systemSettings.system;
        config = { allowUnfree = true; };
      };

      # System Settings
      systemSettings = {
        system = "x86_64-linux";
        profile = "personal";
      };

      # User Settings
      userSettings = {
        name = "Justin Jerez";
        username = "justinj";
        email = "justinjerez@hotmail.com";
        dotfilesDir = "~/.dotfiles";
      };

      nixosConfigPath = "/home/${userSettings.username}/.dotfiles/hosts/${systemSettings.profile}/configuration.nix";
    in
    {
      nixosConfigurations = {
        system = lib.nixosSystem {
          system = systemSettings.system;
          modules = [ (./. + "/hosts" + ("/" + systemSettings.profile) + "/configuration.nix") ];
          specialArgs = {
            inherit userSettings systemSettings;
          };
        };
      };
      homeConfigurations = {
        user = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ (./. + "/hosts" + ("/" + systemSettings.profile) + "/home.nix") ];
          extraSpecialArgs = {
            inherit userSettings systemSettings;
          };
        };
      };
    };
}
