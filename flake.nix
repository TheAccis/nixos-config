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

	 	agenix = {
	 	  url = "github:ryantm/agenix";
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
		meta = import ./meta {
			pkgs = nixpkgs.legacyPackages."x86_64-linux";
			lib = nixpkgs.lib;
			config = { };
		};

    pkgs = nixpkgs.legacyPackages."${meta.system}";

    install-script = import ./meta/lib/scripts/install-system.nix {
      inherit self inputs meta pkgs;
    };

		makeSystem = hostname: nixpkgs.lib.nixosSystem {
			system = meta.system;
			specialArgs = { inherit hostname inputs meta; };
			modules = [ ./hosts/${hostname}/configuration.nix ];
		};
	in
	{
		nixosConfigurations = nixpkgs.lib.genAttrs meta.hostnames makeSystem;
	
    apps."${meta.system}".install = {
      type = "app";
      program = "${pkgs.writeScriptBin "nixos-install-script" install-script}/bin/nixos-install-script";
    };
  };
}