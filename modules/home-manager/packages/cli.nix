{ meta, pkgs, ... }:
{
	home.packages = with pkgs;
	[
		ripgrep
		fd
	];

	programs.bat = {
		enable = true;
		config = {
			italic-text = "always";
			style = "numbers,header";
		};
	};
}