{ config, meta, ... }:
{
	# Desktop files here: /etc/profiles/per-user/accis/share/applications/

	xdg.mimeApps.enable = true;
	xdg.mimeApps.defaultApplications = {
		"text/plain" = "${meta.apps.editor.filename}.desktop";

		"application/pdf" = "${meta.apps.browser.filename}.desktop";

		"image/generic" = "${meta.apps.imageViewer.filename}.desktop";
		"video/generic" = "${meta.apps.videoViewer.filename}.desktop";
		"audio/generic" = "${meta.apps.audioViewer.filename}.desktop";
		"inode/directory" = "${meta.apps.fileManager.filename}.desktop";

		"x-scheme-handler/http" = "${meta.apps.browser.filename}.desktop";
		"x-scheme-handler/https" = "${meta.apps.browser.filename}.desktop";
		"text/html" = "${meta.apps.browser.filename}.desktop";

		"application/x-compressed-tar" = "${meta.apps.archiver.filename}.desktop";
		"application/zip" = "${meta.apps.archiver.filename}.desktop";
		"application/x-bittorrent" = "${meta.apps.torrentClient.filename}.desktop";
		"x-scheme-handler/magnet" = "${meta.apps.torrentClient.filename}.desktop";
	};
}