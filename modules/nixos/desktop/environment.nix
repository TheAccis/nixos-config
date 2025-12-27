{ meta, ... }:
{
	environment.sessionVariables = rec {
		TERMINAL = meta.apps.terminal.command;
		EDITOR = meta.apps.editor.command;
		XDG_BIN_HOME = "$HOME/.local/bin"; # TODO: Remove this hardcode path
		PATH = [
			"${XDG_BIN_HOME}"
		];
	};
}