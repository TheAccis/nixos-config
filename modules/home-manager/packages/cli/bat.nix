{ meta, ... }:
{
	programs.bat.enable = true;
	programs.bat.config = {
		italic-text = "always";
		style = "numbers,header";
	};

	programs."${meta.apps.shell}".shellAliases = { cat = "bat"; };
}