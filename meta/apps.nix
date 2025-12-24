{ config, lib, pkgs, ... }:
{
	apps = {
		browser = {
			name = "Zen";
			filename = "zen-beta";
			command = "zen-beta";
		};

		terminal = {
			name = "Alacritty";
			filename = "alacritty";
			command = "alacritty";

			extra.open-here = "alacritty --working-directory %f";
		};

		editor = {
			name = "VSCode";
			filename = "codium";
			command = "codium";
		};

		file-manager = {
			name = "Thunar";
			filename = "thunar";
			command = "thunar";
		};

		archiver = {
			name = "Engrampa";
			filename = "engrampa";
			command = "engrampa";
		};

		torrent-client = {
			name = "QBitTorrent";
			filename = "org.qbittorrent.qBittorrent";
			command = "qbittorrent";
		};

		image-viewer = {
			name = "qView";
			filename = "com.interversehq.qView";
			command = "qview";
		};

		video-viewer = {
			name = "...";
			filename = "...";
			command = "...";
		};

		audio-viewer = {
			name = "...";
			filename = "...";
			command = "...";
		};
	};
}