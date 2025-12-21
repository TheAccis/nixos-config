{ inputs, ... }:
{
	services.gvfs.enable = true;
	services.tumbler.enable = true;

	systemd.services = {
		"lastlog2-import".enable = false;
		"prepare-kexec".enable = false;
		"resolvconf".enable = false;
	};
}