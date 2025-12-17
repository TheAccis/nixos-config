{ version, inputs, user, meta, pkgs, lib, ... }: 
{
	imports = [ inputs.home-manager.nixosModules.default ];

	home-manager = {
		useGlobalPkgs = true;
		useUserPackages = true;
		backupFileExtension = "backup";

		extraSpecialArgs = {
			inherit meta;
			zen-browser = inputs.zen-browser.packages.${pkgs.system}.default;
			vscode-extensions = inputs.vscode-extensions.extensions.${pkgs.system};
		};

		users.${user} = import ../home-manager/home.nix {
			inherit version user pkgs lib;

			caelestia-shell = inputs.caelestia-shell;
			stylix = inputs.stylix;
		};
	};
}