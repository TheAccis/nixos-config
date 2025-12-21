{ inputs, ... }:
{
	services.gvfs.enable = true;
	services.tumbler.enable = true;

	systemd.services = {
		"prepare-kexec".enable = false;
		"resolvconf".enable = false;
	};
}