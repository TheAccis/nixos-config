{ version, inputs, user, meta, pkgs, lib, ... }: 
{
	imports = [ inputs.home-manager.nixosModules.default ];

	home-manager = {
		useGlobalPkgs = true;
		useUserPackages = true;
		backupFileExtension = "backup";

		extraSpecialArgs = {
			inherit meta;
			vscode-extensions = inputs.vscode-extensions.extensions.${pkgs.system};
		};

		users.${user} = import ../home-manager/home.nix {
			inherit version user pkgs meta lib;

			caelestia-shell = inputs.caelestia-shell;
			zen-browser = inputs.zen-browser;
			nix-flatpak = inputs.nix-flatpak;
			stylix = inputs.stylix;
		};
	};
}