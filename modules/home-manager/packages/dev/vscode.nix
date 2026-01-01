{ vscode-extensions, pkgs, ... }:
{
	programs.vscode = {
		enable = true;
		package = pkgs.vscodium;

		profiles.default = {
			extensions = with vscode-extensions.open-vsx; [
				# VSCode
				ms-ceintl.vscode-language-pack-ru

				# Languages
				jnoortheen.nix-ide
				ms-python.python

				# Languages - QT
				theqtcompany.qt-core
				theqtcompany.qt-qml

				# Languages - Rust
				rust-lang.rust-analyzer
				belfz.search-crates-io
				tamasfe.even-better-toml

				# Tools
				gruntfuggly.todo-tree
			] ++ [ pkgs.vscode-extensions.vadimcn.vscode-lldb ];

			userSettings = {
				"security.workspace.trust.untrustedFiles" = "open";
				"locale" = "ru";

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