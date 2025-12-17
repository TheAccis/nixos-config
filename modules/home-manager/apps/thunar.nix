{ pkgs, ... }:
{
	home.packages = with pkgs; [
		(xfce.thunar.override {
			thunarPlugins = [
				xfce.thunar-archive-plugin
				xfce.thunar-volman
			];
		})

		# TODO: xarchiver not working in thunar
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
}