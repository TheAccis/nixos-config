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

	# Desktop files here: /etc/profiles/per-user/accis/share/applications/
	xdg.mimeApps.enable = true;
	xdg.mimeApps.defaultApplications = {
		"text/plain" = "${meta.apps.editor.filename}.desktop";

		"application/pdf" = "${meta.apps.browser.filename}.desktop";

		"image/generic" = "${meta.apps.image-viewer.filename}.desktop";
		"video/generic" = "${meta.apps.video-viewer.filename}.desktop";
		"audio/generic" = "${meta.apps.audio-viewer.filename}.desktop";
		"inode/directory" = "${meta.apps.file-manager.filename}.desktop";

		"x-scheme-handler/http" = "${meta.apps.browser.filename}.desktop";
		"x-scheme-handler/https" = "${meta.apps.browser.filename}.desktop";
		"text/html" = "${meta.apps.browser.filename}.desktop";

		"application/x-compressed-tar" = "${meta.apps.archiver.filename}.desktop";
		"application/zip" = "${meta.apps.archiver.filename}.desktop";
		"application/x-bittorrent" = "${meta.apps.torrent-client.filename}.desktop";
		"x-scheme-handler/magnet" = "${meta.apps.torrent-client.filename}.desktop";
	};

	home.file."${meta.dirs.templates}/Текстовый файл.txt".text = "";
	home.file."${meta.dirs.templates}/Python скрипт.py".text = "";
	home.file."${meta.dirs.templates}/Файл оболочки.sh".text = "";
}