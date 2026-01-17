{ meta, ... }:
{
	home.file."${meta.dirs.wallpapers}" = {
		source = ../../../other/wallpapers;
		recursive = true;
	};
}