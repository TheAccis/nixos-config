{ config, lib, pkgs, ... }:
{
	dirs = {
		# Default
		pictures = "Изображения";
		documents = "Документы";
		download = "Загрузки";
		templates = "Шаблоны";

		# Own
		wallapers = "${dirs.pictures}/Обои";
		games = "Игры";
	};
}