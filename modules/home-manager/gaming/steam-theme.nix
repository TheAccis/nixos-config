{ pkgs, ... }:
{
	home.packages = with pkgs; [ adwsteamgtk ];

	xdg.desktopEntries."io.github.Foldex.AdwSteamGtk" = {
		name = "AdwSteamGtk";
		noDisplay = true;
	};
}