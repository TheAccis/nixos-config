{ pkgs, ... }:
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    # TODO: Move names to meta
    download = "$HOME/Загрузки";
    documents = "$HOME/Документы";
    pictures = "$HOME/Изображения";

    desktop = null;
    templates = null;
    publicShare = null;
    music = null;
    videos = null;
  };

  home.activation.createGamesDir = ''mkdir -p "$HOME/Игры"'';
}