{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; 
  [ 
    ntfs3g
		udisks
		git

		xdg-desktop-portal-gtk
	];
}