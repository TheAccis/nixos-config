{ pkgs, ... }:
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    # TODO: Move names to meta
    pictures = "$HOME/Изображения";
    documents = "$HOME/Документы";
    download = "$HOME/Загрузки";
    templates = "$HOME/Шаблоны";

    desktop = null;
    publicShare = null;
    music = null;
    videos = null;
  };

  home.activation.createGamesDir = ''mkdir -p "$HOME/Игры"'';
}