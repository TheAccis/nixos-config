{ meta, ... }:
{
  home.file."${meta.dirs.templates}/Текстовый файл.txt".text = "";
  home.file."${meta.dirs.templates}/Python скрипт.py".text = "";
  home.file."${meta.dirs.templates}/Файл оболочки.sh".text = "";
}