{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [ xdg-desktop-portal-hyprland ];

	programs.hyprland = {
		enable = true;
		withUWSM = true;
	};

	security.pam.services.hyprlock = {};
}