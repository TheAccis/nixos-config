{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.home.mutableFile;
in {
  options.home.mutableFile = mkOption {
    type = types.attrsOf (types.submodule ({ name, ... }: {
      options = {
        text = mkOption {
          type = types.lines;
          description = "Содержимое файла";
        };
        executable = mkOption {
          type = types.bool;
          default = false;
          description = "Сделать ли файл исполняемым";
        };
        force = mkOption {
          type = types.bool;
          default = false;
          description = "Если true, перезаписывать файл при каждом обновлении. Если false, создавать только если файла нет.";
        };
      };
    }));
    default = {};
    description = "Управление изменяемыми файлами в домашней директории.";
  };

  config = mkIf (cfg != {}) {
    home.activation.applyMutableFiles = hm.dag.entryAfter ["writeBoundary"] (
      concatStringsSep "\n" (mapAttrsToList (path: file: ''
        TARGET_PATH="$HOME/${path}"
        # Проверяем, нужно ли записывать файл
        if [ ! -e "$TARGET_PATH" ] || ${if file.force then "true" else "false"}; then
          $DRY_RUN_CMD mkdir -p "$(dirname "$TARGET_PATH")"
          
          # Используем временный файл для безопасной записи через cat
          $DRY_RUN_CMD cat <<'EOF' > "$TARGET_PATH"
${file.text}
EOF
          $DRY_RUN_CMD chmod ${if file.executable then "755" else "644"} "$TARGET_PATH"
          echo "${if file.force then "Updated" else "Created"} mutable file: $TARGET_PATH"
        fi
      '') cfg)
    );
  };
}