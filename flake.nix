{
	description = "My system configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11?shallow=1";

		nix-flatpak.url = "github:gmodena/nix-flatpak";

		disko.url = "github:nix-community/disko";
		disko.inputs.nixpkgs.follows = "nixpkgs";

		home-manager.url = "github:nix-community/home-manager/release-25.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

	 	agenix.url = "github:ryantm/agenix";
	 	agenix.inputs.nixpkgs.follows = "nixpkgs";

		vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

		stylix.url = "github:danth/stylix/release-25.11";
		stylix.inputs.nixpkgs.follows = "nixpkgs";

		caelestia-shell.url = "github:caelestia-dots/shell";
		caelestia-shell.inputs.nixpkgs.follows = "nixpkgs";

    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";
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
			modules = [
				./hosts/${hostname}
				inputs.disko.nixosModules.disko
        inputs.home-manager.nixosModules.default
			];
		};
	in
	{
		nixosConfigurations = nixpkgs.lib.genAttrs meta.hostnames makeSystem;

		apps."${meta.system}".install = {
			type = "app";
			program = "${pkgs.writeShellScriptBin "nixos-install-script" install-script}/bin/nixos-install-script";
		};
	};
}