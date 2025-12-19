{ config, meta, lib, ... }:
let
	home = config.home.homeDirectory;
in
{
	xdg = {
		enable = true;
		configHome = "${home}/${meta.dirs.apps-config}";
		stateHome = "${home}/${meta.dirs.apps-state}";
		dataHome = "${home}/${meta.dirs.apps-share}";
		cacheHome = "${home}/${meta.dirs.apps-cache}";
	};
	
	xdg.userDirs = {
		enable = true;
		createDirectories = true;

		pictures = "${home}/${meta.dirs.pictures}";
		videos = "${home}/${meta.dirs.videos}";
		music = "${home}/${meta.dirs.music}";

		documents = "${home}/${meta.dirs.documents}";
		download = "${home}/${meta.dirs.download}";
		templates = "${home}/${meta.dirs.templates}";

		desktop = null;
		publicShare = null;

		extraConfig = {
			XDG_SCREENSHOTS_DIR = "${home}/${meta.dirs.screenshots}";
		};
	};
	
	# Create custom folders
	systemd.user.tmpfiles.rules = map (dir: 
		"d ${home}/${dir} 0755 - - -"
	) meta.dirs.custom;
}