{ pkgs, ... }:
{
	services.resolved.enable = true;
	networking = {
		modemmanager.enable = false;
		firewall.enable = false;

		hostName = hostname;

		networkmanager = {
			enable = true;
			wifi.powersave = false;
		};
	};

	systemd.services."NetworkManager-wait-online".enable = false;
	systemd.services."resolvconf".enable = false;
}