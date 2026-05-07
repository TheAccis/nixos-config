{ vscode-extensions, pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt-rfc-style
  ];

	programs.vscode = {
		enable = true;
		package = pkgs.vscodium;

		profiles.default = {
			extensions = with vscode-extensions.open-vsx; [
				# Languages
				astro-build.astro-vscode # Astro
				tamasfe.even-better-toml # TOML
				rust-lang.rust-analyzer # Rust
				rhaiscript.vscode-rhai # Rhai
				jnoortheen.nix-ide # Nix IDE

				# WebAssembly
				bytecodealliance.wit-idl

				# Tools
				esbenp.prettier-vscode
				gruntfuggly.todo-tree
			];

			userSettings = {
				"security.workspace.trust.untrustedFiles" = "open";

				"terminal.integrated.stickyScroll.enabled" = false;

				"editor.stickyScroll.enabled" = false;
				"editor.detectIndentation" = false;
				"editor.minimap.enabled" = false;
				"editor.insertSpaces" = false;
				"editor.formatOnSave" = true;
				"editor.fontSize" = 18;

				"workbench.colorTheme" = "Default Dark Modern";
				"workbench.navigationControl.enabled" = false;
				"workbench.layoutControl.enabled" = false;
				"workbench.startupEditor" = "none";

				"window.customTitleBarVisibility" = "never";
				"window.menuBarVisibility" = "hidden";
				"window.titleBarStyle" = "custom";
				"window.commandCenter" = false;

				"explorer.confirmDragAndDrop" = false;
				"explorer.confirmPasteNative" = false;
				"explorer.confirmDelete" = false;

				"files.trimTrailingWhitespace" = true;

				"git.openRepositoryInParentFolders" = "never";
				"git.enableSmartCommit" = true;
				"git.confirmSync" = false;
				"git.autofetch" = true;

				"[astro]" = {
					"editor.tabSize" = 4;
					"editor.defaultFormatter" = "astro-build.astro-vscode";
				};

				"[nix]" = {
					"editor.tabSize" = 4;
					"editor.formatOnSave" = false;
					"editor.insertSpaces" = false;
				};
			};
		};
	};
}