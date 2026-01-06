{ pkgs, ... }:
{
	programs.hyprland = {
		enable = true;
		withUWSM = true;
		
		portalPackage = pkgs.xdg-desktop-portal-hyprland;
	};

	xdg.portal = {
		enable = true;
		
		extraPortals = [
			pkgs.xdg-desktop-portal-hyprland
			pkgs.xdg-desktop-portal-gtk
		];
		
		wlr = {
			enable = true;
			settings = {
				screencast.choose_monitor = false;
			};
		};
	};

	#security.pam.services.hyprlock = {};
}