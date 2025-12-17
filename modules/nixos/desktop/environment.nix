{ meta, ... }:
{
	environment.sessionVariables = rec {
		TERMINAL = meta.apps.terminal.command;
		EDITOR = meta.apps.editor.command;
		XDG_BIN_HOME = "$HOME/.local/bin";
		PATH = [
			"${XDG_BIN_HOME}"
		];
	};
}