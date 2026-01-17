{ config, meta, lib, ... }:
let
	dirs = meta.dirs;
	apps = meta.apps;
in
{
	xdg.userDirs = {
		enable = true;
		createDirectories = true;

		pictures = "${meta.home}/${dirs.pictures}";
		videos = "${meta.home}/${dirs.videos}";
		music = "${meta.home}/${dirs.music}";

		documents = "${meta.home}/${dirs.documents}";
		download = "${meta.home}/${dirs.download}";
		templates = "${meta.home}/${dirs.templates}";

		desktop = null;
		publicShare = null;

		extraConfig = {
			XDG_SCREENSHOTS_DIR = "${meta.home}/${dirs.screenshots}";
			XDG_PROJECTS_DIR = "${meta.home}/${dirs.projects}";
		};
	};

	# Create custom folders
	systemd.user.tmpfiles.rules = map (dir:
		"d ${meta.home}/${dir} 0755 - - -"
	) dirs.custom;

	# Desktop files here: /etc/profiles/per-user/accis/share/applications/
	xdg.mimeApps.enable = true;
	xdg.mimeApps.defaultApplications = {
		"application/octet-stream" = "${apps.editor.filename}.desktop";

		"text/plain" = "${apps.editor.filename}.desktop";
		"text/markdown" = "${apps.editor.filename}.desktop";
		"text/x-makefile" = "${apps.editor.filename}.desktop";
		"text/x-c++src" = "${apps.editor.filename}.desktop";
		"text/x-python" = "${apps.editor.filename}.desktop";
		"application/json" = "${apps.editor.filename}.desktop";
		"application/xml" = "${apps.editor.filename}.desktop";
		"application/x-shellscript" = "${apps.editor.filename}.desktop";

		"application/pdf" = "${apps.browser.filename}.desktop";

		"image/generic" = "${apps.image-viewer.filename}.desktop";
		"video/generic" = "${apps.video-viewer.filename}.desktop";
		"audio/generic" = "${apps.audio-viewer.filename}.desktop";
		"inode/directory" = "${apps.file-manager.filename}.desktop";

		"x-scheme-handler/http" = "${apps.browser.filename}.desktop";
		"x-scheme-handler/https" = "${apps.browser.filename}.desktop";
		"text/html" = "${apps.browser.filename}.desktop";

		"application/x-compressed-tar" = "${apps.archiver.filename}.desktop";
		"application/x-7z-compressed" = "${apps.archiver.filename}.desktop";
		"application/x-tar" = "${apps.archiver.filename}.desktop";
		"application/x-rar" = "${apps.archiver.filename}.desktop";
		"application/zip" = "${apps.archiver.filename}.desktop";

		"application/x-bittorrent" = "${apps.torrent-client.filename}.desktop";
		"x-scheme-handler/magnet" = "${apps.torrent-client.filename}.desktop";
	};

	# Dev templates
	home.file."${dirs.dev-templates}/rust-script.rs".text = "";
	home.file."${dirs.dev-templates}/python-script.py".text = "";
	home.file."${dirs.dev-templates}/shell-script.sh".text = "";

	# Nix templates
	home.file."${dirs.nix-templates}/nix-script.nix".text = "";
	home.file."${dirs.nix-templates}/flake.nix".text = "";

	# Other templates
	home.file."${dirs.templates}/text-file.txt".text = "";
}