{ config, lib, pkgs, ... }:
{
	dirs = rec {
		# User directories
		documents = "Документы";
		download = "Загрузки";
		templates = "Шаблоны";
    projects = "${documents}/Проекты";
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
      projects
			media
			games
		];
	};
}