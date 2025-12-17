{ vscode-extensions, pkgs, ... }:
{
	programs.vscode = {
		enable = true;
		package = pkgs.vscodium;

		profiles.default = {
			extensions = with vscode-extensions.open-vsx; [
				# VSCode
				ms-ceintl.vscode-language-pack-ru # Russian language

				# Languages
				jnoortheen.nix-ide # Nix
				ms-python.python # Python

				# Tools
				prettier.prettier-vscode # Prettier
				gruntfuggly.todo-tree # Todo tree
			];

			userSettings = {
				"editor.defaultFormatter" = "prettier.prettier-vscode";
				"editor.fontSize" = 18;

				"workbench.colorTheme" = "Default Dark Modern";
				"workbench.startupEditor" = false;

				"explorer.confirmDragAndDrop" = false;
				"explorer.confirmDelete" = false;

				"git.confirmSync" = false;
				"git.autofetch" = true;
			};
		};
	};
}