{ pkgs, ... }:
{
  networking.modemmanager.enable = false;

  systemd.services."NetworkManager-wait-online".enable = false;
	networking.networkmanager = {
		enable = true;
		wifi.powersave = false;
	};

  systemd.services."resolvconf".enable = false;
  services.resolved.enable = true;
}