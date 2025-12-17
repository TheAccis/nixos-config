{ pkgs, ... }:
{
	networking.networkmanager = {
		enable = true;
		wifi.powersave = false;
	};
}