{ config, ... }:
let
  qs-config-path = "${config.xdg.configHome}/quickshell";
in 
{
	home.sessionVariables = {
		QT_LOGGING_RULES = "qt.qpa.wayland.decorations=false";
		QML_IMPORT_PATH = "${qs-config-path}/components";
	};

	programs.quickshell = {
		enable = true;
		systemd.enable = true;
	};
}