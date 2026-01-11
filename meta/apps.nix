{ config, lib, pkgs, ... }:
{
	apps = {
    shell = "zsh";
		#shell = {
    #  name = "zsh";
#
    #  extra.init-content = "";
    #  extra.aliases = {};
    #};

		browser = {
			filename = "zen-beta";
			command = "zen-beta";
		};

		terminal = {
			filename = "alacritty";
			command = "alacritty";

			extra.open-here = "${pkgs.alacritty}/bin/alacritty --working-directory %f";
			extra.exec-here = ''${pkgs.alacritty}/bin/alacritty -e sh -c "%f; echo; read -n1 -p 'Нажмите любую клавишу для выхода...'"'';
		};

		editor = {
			filename = "codium";
			command = "codium";
		};

		file-manager = {
			filename = "thunar";
			command = "thunar";
		};

		archiver = {
			filename = "engrampa";
			command = "engrampa";
      pkg = pkgs.mate.engrampa;
		};

    # Fragments
		torrent-client = {
			filename = "de.haeckerfelix.Fragments";
			command = "fragments";
      pkg = pkgs.fragments;
		};

		screenshot-app = {
			filename = "org.qbittorrent.qBittorrent";
			command = "hyprshot";
      pkg = pkgs.hyprshot;

      extra.take-screen = "hyprshot -m output";
      extra.take-window = "hyprshot -m window";
      extra.take-region = "hyprshot -m regoin";
		};

		image-viewer = {
			filename = "com.interversehq.qView";
			command = "qview";
		};

		video-viewer = {
			filename = "...";
			command = "...";
		};

		audio-viewer = {
			filename = "...";
			command = "...";
		};
	};
}