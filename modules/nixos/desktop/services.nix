{ inputs, ... }:
{
	services.gvfs.enable = true;
	services.tumbler.enable = true;

  services.flatpak.enable = true;

	systemd.services."prepare-kexec".enable = false;
}