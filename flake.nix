{
  description = "Nixos Take 2";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ { self, nixpkgs, stylix, home-manager, nvf, ... }: {

    packages."x86_64-linux".nvim = 
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [ ./modules/nixos/programs/cli/nvf/nvf.nix ];
      }).neovim;

    packages."x86_64-linux".steam = stdenv.mkDerivation {
      name = "steam";
      src = ./modules/nixos/programs/gui/steam/steam.nix;
    };

    nixosConfigurations.nixBox2 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        stylix.nixosModules.stylix
        nvf.nixosModules.default
        ./configuration.nix
        home-manager.nixosModules.home-manager 
        {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.scorpio = import ./home.nix;
          backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
