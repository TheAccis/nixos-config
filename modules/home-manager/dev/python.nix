{ pkgs, ... }:
{
	home.packages = with pkgs; [
		(python312.withPackages (pythonPackages: with pythonPackages; [
			matplotlib
			pandas
			numpy
		]))
	];
}