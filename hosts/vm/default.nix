{
	imports = [
		../../modules/nixos

		./hardware-configuration.nix
	];

  disko.devices.disk.main.device = "/dev/sda";

	services.qemuGuest.enable = true;
	services.spice-vdagentd.enable = true;

	boot.initrd.availableKernelModules = [
		"virtio_net"
		"virtio_pci"
		"virtio_mmio"
		"virtio_blk"
		"virtio_scsi"
	];

	services.xserver.videoDrivers = [ "virtio_gpu" ];
}