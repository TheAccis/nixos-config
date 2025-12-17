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
		};

		editor = {
			name = "VSCode";
			filename = "codium";
			command = "codium";
		};

		fileManager = {
			name = "Thunar";
			filename = "thunar";
			command = "thunar";
		};

		archiver = {
			name = "XArchiver";
			filename = "xarchiver";
			command = "xarchiver";
		};

		torrentClient = {
			name = "QBitTorrent";
			filename = "org.qbittorrent.qBittorrent";
			command = "qbittorrent";
		};

		imageViewer = {
			name = "qView";
			filename = "com.interversehq.qView";
			command = "qview";
		};

		videoViewer = {
			name = "...";
			filename = "...";
			command = "...";
		};

		audioViewer = {
			name = "...";
			filename = "...";
			command = "...";
		};
	};
}