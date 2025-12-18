{ meta, ... }:
{
	xdg = {
	  enable = true;
	  configHome = "$HOME/${apps-home}/${apps-config}";
	  stateHome = "$HOME/${apps-home}/${apps-state}";
	  dataHome = "$HOME/${apps-home}/${apps-share}";
	  cacheHome = "$HOME/${apps-home}/${apps-cache}";
	};
	
	xdg.userDirs = {
		enable = true;
		createDirectories = true;

		pictures = meta.dirs.pictures;
		videos = meta.dirs.videos;
		music = meta.dirs.music;

		documents = meta.dirs.documents;
		download = meta.dirs.download;
		templates = meta.dirs.templates;

		desktop = null;
		publicShare = null;

		extraConfig = {
			XDG_SCREENSHOTS_DIR = "$HOME/${meta.dirs.screenshots}";
		};
	};

	systemd.user.tmpfiles.rules = [
		"d $HOME/${meta.dirs.screenshots} 0755 - - -"
		"d $HOME/${meta.dirs.wallpapers} 0755 - - -"
		"d $HOME/${meta.dirs.torrent} 0755 - - -"
		"d $HOME/${meta.dirs.games} 0755 - - -"
		"d $HOME/${meta.dirs.media} 0755 - - -"
	];
}