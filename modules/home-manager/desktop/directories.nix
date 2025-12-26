{ config, meta, lib, ... }:
{	
	xdg.userDirs = {
		enable = true;
		createDirectories = true;

		pictures = "${meta.home}/${meta.dirs.pictures}";
		videos = "${meta.home}/${meta.dirs.videos}";
		music = "${meta.home}/${meta.dirs.music}";

		documents = "${meta.home}/${meta.dirs.documents}";
		download = "${meta.home}/${meta.dirs.download}";
		templates = "${meta.home}/${meta.dirs.templates}";

		desktop = null;
		publicShare = null;

		extraConfig = {
			XDG_SCREENSHOTS_DIR = "${meta.home}/${meta.dirs.screenshots}";
			XDG_PROJECTS_DIR = "${meta.home}/${meta.dirs.projects}";
		};
	};
	
	# Create custom folders
	systemd.user.tmpfiles.rules = map (dir:
		"d ${meta.home}/${dir} 0755 - - -"
	) meta.dirs.custom;
}