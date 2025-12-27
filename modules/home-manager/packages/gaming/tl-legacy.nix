{ config, meta, pkgs, ... }:
let
  path = "${meta.home}/${meta.dirs.games}/Legacy-Launcher";
  download-url = "https://dl.llaun.ch/legacy/bootstrap";
  bootstrap = "${path}/bootstrap.jar";
  launcher = "${path}/launcher.jar";
  
  # Создаем FHS-совместимое окружение для Minecraft
  minecraft-fhs = pkgs.buildFHSUserEnv {
    name = "minecraft-fhs";
    targetPkgs = pkgs: with pkgs; [
      # Основные зависимости для Minecraft
      openjdk
      glib
      gtk3
      xorg.libX11
      xorg.libXcursor
      xorg.libXi
      xorg.libXrandr
      xorg.libXinerama
      xorg.libXxf86vm
      xorg.libXfixes
      xorg.libXrender
      mesa
      libglvnd
      zlib
      stdenv.cc.cc.lib  # для libstdc++.so.6 и других системных библиотек
      alsa-lib
      libpulseaudio
    ];
    
    # Дополнительные переменные среды для Java
    profile = ''
      export _JAVA_AWT_WM_NONREPARENTING=1
      export GDK_BACKEND=x11
      export SDL_VIDEODRIVER=x11
      export MESA_LOADER_DRIVER_OVERRIDE=iris,i965,radeonsi,nouveau,virgl
    '';
    
    # Запускаем Java в FHS-окружении
    runScript = "java";
  };
in
{
  home.packages = [
    # Основной скрипт для запуска лаунчера
    (pkgs.writeShellScriptBin "legacy-launcher" ''
      mkdir -p "${path}"

      if [ ! -f "${bootstrap}" ]; then
        echo "Downloading Legacy Launcher..."
        ${pkgs.curl}/bin/curl -L "${download-url}" -o "${bootstrap}.tmp"
        mv "${bootstrap}.tmp" "${bootstrap}"
        cp "${bootstrap}" "${launcher}"
      fi

      # Запускаем лаунчер в обычном окружении
      export _JAVA_OPTIONS="-Duser.home=${path}"
      export _JAVA_AWT_WM_NONREPARENTING=1
      
      java -jar "${bootstrap}"
    '')

    # Специальный скрипт для запуска Minecraft в FHS-окружении
    (pkgs.writeShellScriptBin "run-minecraft-fhs" ''
      exec ${minecraft-fhs}/bin/java "$@"
    '')
  ];

  xdg.desktopEntries = {
    legacy-launcher = {
      name = "Legacy Launcher";
      exec = "legacy-launcher";
      icon = "minecraft";
      categories = [ "Game" ];
      terminal = false;
    };
  };

  home.file."${path}/tl.args".text = ''
--packageMode
portable

--targetJar
${launcher}

--targetLibFolder
${path}/libraries

--javaPath
${pkgs.lib.getBin pkgs.openjdk}/bin/java

--javaPath17
${pkgs.lib.getBin pkgs.openjdk}/bin/java

--javaPath8
${pkgs.lib.getBin pkgs.openjdk8}/bin/java

--customJavaPath
${pkgs.writeShellScript "custom-java" ''
  exec ${minecraft-fhs}/bin/java "$@"
'}


--

--settings
${path}/tl.properties

--directory
${path}
  '';

  meta.lib.home.mutable-file."${path}/.tlauncher/legacy.properties".text = ''
bootstrap.switchToBeta=false
client=2523222e-dde8-4715-92e5-bd963e2b54a4
connection.ssl=true
experiments.available=zgc_generational;tenuring;max_xms;updated_lwjgl;updated_jna
experiments.enabled=none
gui.alerton.modified=false
gui.alerton.release=false
gui.alerton.snapshot=false
gui.direction.loginform=center
gui.font=12
gui.font.old=12
gui.laf.v1.state=auto
gui.logger=none
gui.logger.fullcommand=false
gui.logger.height=500
gui.logger.width=720
gui.logger.x=30
gui.logger.y=30
gui.notices.enabled=false
gui.size=894;1150
locale=${meta.locale.default}
minecraft.crash=false
minecraft.fullscreen=true
minecraft.gamedir.separate=version
minecraft.gamemode=true
minecraft.gpu=DISCRETE
minecraft.improvedargs=true
minecraft.improvedargs.type=DEFAULT
minecraft.jre.change-trust-store=false
minecraft.jre.type=recommended
minecraft.jre.custom.path=${pkgs.lib.getBin pkgs.openjdk}/bin/java
minecraft.mods.removeUndesirable=true
minecraft.onlaunch=hide
minecraft.servers.promoted=true
minecraft.servers.promoted.ingame=true
minecraft.size=925;530
minecraft.versions.launcher=false
minecraft.versions.modified=true
minecraft.versions.old_alpha=false
minecraft.versions.old_beta=false
minecraft.versions.only-installed=false
minecraft.versions.pending=false
minecraft.versions.release=true
minecraft.versions.snapshot=false
minecraft.versions.sub.old_release=false
minecraft.versions.sub.remote=true
minecraft.xmx=10240
notice.enabled=false
notice.promoted=true
settings.version=3
launcher.java.path=${pkgs.lib.getBin pkgs.openjdk}/bin/java
launcher.java.path.custom=${pkgs.writeShellScript "custom-java" ''
  exec ${minecraft-fhs}/bin/java "$@"
''}
  '';

  # Дополнительно: добавляем библиотеки в LD_LIBRARY_PATH как fallback
  home.sessionVariables = {
    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (with pkgs; [
      stdenv.cc.cc.lib
      zlib
      libGL
      mesa
      alsa-lib
      libpulseaudio
    ]);
  };
}