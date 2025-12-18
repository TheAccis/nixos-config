{ meta, ... }:
{
	xdg.userDirs = {
		enable = true;
		createDirectories = true;

		pictures = "$HOME/${meta.dirs.pictures}";
		documents = "$HOME/${meta.dirs.documents}";
		download = "$HOME/${meta.dirs.download}";
		templates = "$HOME/${meta.dirs.templates}";

		desktop = null;
		publicShare = null;
		music = null;
		videos = null;
	};

	home.activation.createOtherDirs = ''
		mkdir -p "$HOME/${meta.dirs.games}"
	'';
}