{ meta, pkgs, ... }:
{
	home.packages = with pkgs;
	[
		ripgrep
		fd
	];

	programs."${meta.apps.shell}".shellAliases =
	{
		grep = "rg"; # grep -> ripgrep

		find = "fd"; # find -> fd

		cat = "bat"; # cat -> bat
	};

	programs.bat = {
		enable = true;
		config = {
			italic-text = "always";
			style = "numbers,header";
		};
	};
}