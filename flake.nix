{
	description = "My system configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

		disko = {
			url = "github:nix-community/disko";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nix-flatpak = {
			url = "github:gmodena/nix-flatpak";
		};

		vscode-extensions = {
			url = "github:nix-community/nix-vscode-extensions";
		};

		stylix = {
			url = "github:danth/stylix/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		zen-browser = {
			url = "github:0xc000022070/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		caelestia-shell = {
			url = "github:caelestia-dots/shell";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
	let
		system = "x86_64-linux";

		version = "25.11";

		user = "accis";

		hostnames = [
			"acer-nitro-lite"
			"accis-pc"
		];

		# TODO: Change ./meta/apps.nix to ./meta
		meta = import ./meta/apps.nix {
			pkgs = nixpkgs.legacyPackages.${system};
			lib = nixpkgs.lib;
			config = { };
		};

		makeSystem = hostname: nixpkgs.lib.nixosSystem {
			system = system;
			specialArgs = { inherit inputs version hostname user meta; };
			modules = [ ./hosts/${hostname}/configuration.nix ];
		};
	in {
		nixosConfigurations = nixpkgs.lib.genAttrs hostnames makeSystem;
	};
}