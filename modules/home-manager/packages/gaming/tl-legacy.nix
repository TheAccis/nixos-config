# FIXME: Minecraft not launching from launcher
{ config, meta, pkgs, ... }:
let
  path = "${meta.home}/${meta.dirs.games}/Legacy-Launcher";
  download-url = "https://dl.llaun.ch/legacy/bootstrap";
  bootstrap = "${path}/bootstrap.jar";
  launcher = "${path}/launcher.jar";
in
{
  home.packages = [
    (pkgs.writeShellScriptBin "legacy-launcher" ''
      mkdir -p "${path}"

      if [ ! -f "${bootstrap}" ]; then
        echo "Downloading Legacy Launcher..."
        ${pkgs.curl}/bin/curl -L "${download-url}" -o "${bootstrap}.tmp"
        mv "${bootstrap}.tmp" "${bootstrap}"
        cp "${bootstrap}" "${launcher}"
      fi

      export _JAVA_OPTIONS="-Duser.home=${path}"
      export _JAVA_AWT_WM_NONREPARENTING=1
      
      java -jar "${bootstrap}"
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
  '';
}