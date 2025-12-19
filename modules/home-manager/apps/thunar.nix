{ config, pkgs, meta, ... }:
{
	home.packages = with pkgs; [
		(xfce.thunar.override {
			thunarPlugins = [
				xfce.thunar-archive-plugin
				xfce.thunar-volman
			];
		})

		# FIXME: xarchiver not working in thunar
		xarchiver
	];

	xdg.desktopEntries."thunar-bulk-rename" = {
		name = "Thunar Bulk Rename";
		noDisplay = true;
	};

	xdg.desktopEntries."thunar-settings" = {
		name = "Thunar Settings";
		noDisplay = true;
	};

	xdg.desktopEntries."thunar-volman-settings" = {
		name = "Thunar Volman Settings";
		noDisplay = true;
	};

	home.file."${config.xdg.configHome}/Thunar/uca.xml".text = ''
<?xml version="1.0" encoding="UTF-8"?>
<actions>
<action>
		<icon>utilities-terminal</icon>
		<name>Открыть терминал здесь</name>
		<submenu></submenu>
		<unique-id>17102345-1</unique-id>
		<command>${meta.apps.terminal.extra.open-here}</command>
		<description>Открыть терминал в текущей папке</description>
		<patterns>*</patterns>
		<directories/>
</action>
</actions>
	'';
}