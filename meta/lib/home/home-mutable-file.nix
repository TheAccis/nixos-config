{ config, lib, pkgs, ... }:

let
  inherit (lib) types mkOption mkIf concatStringsSep mapAttrsToList hasPrefix optionalString escapeShellArg;
  
  cfg = config.meta.lib.home.mutable-file;
  
  mkFileAction = file: let
    mode = if file.executable then "755" else "644";
    action = if file.force then "Updated" else "Created";
  in ''
    cat > "$real_path" <<'__EOF__'
${file.text}
__EOF__
    chmod ${mode} "$real_path"
    echo "${action} mutable file: $real_path"
  '';

in {
  options.meta.lib.home.mutable-file = mkOption {
    type = types.attrsOf (types.submodule {
      options = {
        text = mkOption { type = types.lines; description = "Содержимое файла"; };
        executable = mkOption { type = types.bool; default = false; description = "Сделать ли файл исполняемым"; };
        force = mkOption { type = types.bool; default = false; description = "Если true, перезаписывать файл при каждом обновлении. Если false, создавать только если файла нет."; };
      };
    });
    default = { };
  };

  config = mkIf (cfg != { }) {
    home.activation.applyMutableFiles = lib.hm.dag.entryAfter ["writeBoundary"] (let
      createFile = path: file: 
        let target = if hasPrefix "/" path then path else "\${HOME}/${path}";
        in ''
          target_path=${escapeShellArg target}
          real_path=$(eval echo "$target_path")
          mkdir -p "$(dirname "$real_path")" || exit 1
          ${optionalString file.force (mkFileAction file)}
          ${optionalString (!file.force) "[ ! -e \"$real_path\" ] && ${mkFileAction file}"}
        '';
        
      scripts = concatStringsSep "\n" (mapAttrsToList createFile cfg);
    in ''
      set -euo pipefail
      ${optionalString (config.home-manager.useUserPackages or false) ''
        eval "$(${pkgs.nix}/bin/nix-shell --pure --command 'env' --run 'env' | grep -v '^PATH=')"
      ''}
      ${scripts}
    '');
  };
}