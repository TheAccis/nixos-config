{ pkgs, lib, config }:
let
	files = [
		./lib

		./directories.nix
		./settings.nix
		./apps.nix
	];
	
	importedFiles = map (path: import path { inherit pkgs lib config; }) files;
in
	lib.foldl' lib.recursiveUpdate {} importedFiles