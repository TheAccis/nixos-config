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

				# Languages - QT
				theqtcompany.qt-core
				theqtcompany.qt-qml

				# Tools
				gruntfuggly.todo-tree # Todo tree
        # Code spell checker
        # Russian code spell checker
			];

			userSettings = {
				"security.workspace.trust.untrustedFiles" = "open";

				"editor.detectIndentation" = false;
				"editor.insertSpaces" = false;
				"editor.fontSize" = 18;
				"editor.tabSize" = 3;

				"workbench.colorTheme" = "Default Dark Modern";
				"workbench.startupEditor" = "none";

				"explorer.confirmDragAndDrop" = false;
        "explorer.confirmPasteNative" = false;
				"explorer.confirmDelete" = false;

				"git.confirmSync" = false;
				"git.autofetch" = true;
			};
		};
	};
}