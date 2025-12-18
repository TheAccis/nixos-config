{ config, lib, pkgs, ... }:
{
	dirs = rec {
		# Default
		pictures = "Изображения";
		documents = "Документы";
		download = "Загрузки";
		templates = "Шаблоны";

		# Own
		wallapers = "${pictures}/Обои";
		games = "Игры";
	};
}