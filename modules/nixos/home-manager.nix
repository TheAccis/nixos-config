{ nur-pkgs, config, inputs, meta, pkgs, lib, ... }: 
{
	imports = [ inputs.home-manager.nixosModules.default ];

	home-manager = {
		useGlobalPkgs = true;
		useUserPackages = true;
		backupFileExtension = "backup";

		extraSpecialArgs = {
			inherit meta;
			vscode-extensions = inputs.vscode-extensions.extensions.${meta.system};
      firefox-addons = nur-pkgs.repos.rycee.firefox-addons;

			modules = {
				caelestia-shell = inputs.caelestia-shell;
				zen-browser = inputs.zen-browser;
				nix-flatpak = inputs.nix-flatpak;
				stylix = inputs.stylix;
			};
		};

		users.${meta.user} = import ../home-manager/home.nix;
	};
}