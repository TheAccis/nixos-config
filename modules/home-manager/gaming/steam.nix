{ pkgs, ... }:
{
	home.packages = with pkgs; [
		adwsteamgtk
		steam
		# gamescope
	];

	xdg.desktopEntries."io.github.Foldex.AdwSteamGtk" = {
		name = "AdwSteamGtk";
		noDisplay = true;
	};
}