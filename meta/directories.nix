{ config, lib, pkgs, ... }:
{
	dirs = rec {
		# Base directories
		apps-home = ".apps-home";
		apps-config = "${apps-home}/config";
		apps-state = "${apps-home}/state";
		apps-share = "${apps-home}/store";
		apps-cache = "${apps-home}/cache";

		# User directories
		documents = "Документы";
		download = "Загрузки";
		templates = "Шаблоны";
		games = "Игры";

		# User directories - media
		pictures = "${media}/Изображения";
		videos = "${media}/Видео";
		music = "${media}/Музыка";
		media = "Медиа";

		# Custom
		screenshots = "${pictures}/Скриншоты";
		wallpapers = "${pictures}/Обои";
		torrents = "${download}/Торренты";

		custom = [
			screenshots
			wallpapers
			torrents
			media
			games
		];
	};
}