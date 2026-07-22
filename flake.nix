{
  description = "Nixos Take 2";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = intputs @ { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.nixBox2 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
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
