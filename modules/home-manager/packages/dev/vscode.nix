{ vscode-extensions, pkgs, ... }:
{
	programs.vscode = {
		enable = true;
		package = pkgs.vscodium;

		profiles.default = {
			extensions = with vscode-extensions.open-vsx; [
				# Languages
				jnoortheen.nix-ide

				# Languages - Rust
				rust-lang.rust-analyzer
				tamasfe.even-better-toml

				# WebAssembly
				bytecodealliance.wit-idl

				# Tools
				gruntfuggly.todo-tree
			]; # ++ [ pkgs.vscode-extensions.vadimcn.vscode-lldb ];

			userSettings = {
				"security.workspace.trust.untrustedFiles" = "open";

				"editor.insertSpaces" = false;
				"editor.fontSize" = 18;

				"workbench.colorTheme" = "Default Dark Modern";
				"workbench.startupEditor" = "none";

				"window.menuBarVisibility" = "hidden";
				"window.titleBarStyle" = "custom";
				"window.customTitleBarVisibility" = "never";

				"explorer.confirmDragAndDrop" = false;
				"explorer.confirmPasteNative" = false;
				"explorer.confirmDelete" = false;

				"files.trimTrailingWhitespace" = true;

				"git.confirmSync" = false;
				"git.autofetch" = true;
				"git.enableSmartCommit" = true
			};
		};
	};
}