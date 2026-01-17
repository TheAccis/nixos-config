{ config, lib, pkgs, ... }:
{
	dirs = rec {
		# User directories
		documents = "documents";
		download = "download";
		games = "games";

		# User directories - projects
		projects = "${documents}/projects";
		rust-projects = "${projects}/rust";

		# User directories - media
		pictures = "${media}/pictures";
		videos = "${media}/videos";
		music = "${media}/music";
		media = "media";

		# User directories - templates
		dev-templates = "${templates}/dev";
		nix-templates = "${templates}/nix";
		templates = "templates";

		# Custom
		screenshots = "${pictures}/screenshots";
		wallpapers = "${pictures}/wallpapers";
		torrents = "${download}/torrents";

		custom = [
			rust-projects
			screenshots
			wallpapers
			torrents
			projects
			media
			games
		];
	};
}