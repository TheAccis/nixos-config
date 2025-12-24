{
  services.linux-wallpaperengine = {
  enable = true;
  # Путь к папке assets самого Wallpaper Engine (нужна для работы шейдеров и т.д.)
  # Обычно находится в SteamApps/common/wallpaper_engine/assets
  assetsPath = "/home/имя_пользователя/.local/share/Steam/steamapps/common/wallpaper_engine/assets";
  
  wallpapers = [
    {
      monitor = "DP-1"; # Имя вашего монитора
      wallpaperId = "12345678"; # ID из мастерской Steam (цифры в названии папки)
      scaling = "fill";
      fps = 60;
    }
  ];
};
}