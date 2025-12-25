{ meta, ... }:
{
	programs.bat.enable = true;
	programs.bat.config = {
		theme = "Dracula";
		italic-text = "always";
		style = "numbers,header";
	};

	programs."${meta.apps.shell}".shellAliases = { cat = "bat"; };
}