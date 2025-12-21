{ meta, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		virt-viewer
		spice
		spice-gtk
		spice-protocol
		# win-virtio # Windows-specific: Drivers
		# win-spice  # Windows-specific: Agent
	];

	services.spice-vdagentd.enable = true;
	programs.virt-manager.enable = true;

	virtualisation.spiceUSBRedirection.enable = true;
	virtualisation.libvirtd = {
		enable = true;
		onBoot = "ignore";
		qemu = {
			package = pkgs.qemu_kvm;
			runAsRoot = true;
			# swtpm.enable = true; # Windows-specific: TPM 2.0 emulation
		};
	};

	users.users."${meta.user}".extraGroups = [ "libvirtd" "kvm" ];

	systemd.services.libvirtd.wantedBy = pkgs.lib.mkForce [];
	systemd.sockets.libvirtd.wantedBy = [ "sockets.target" ];

  systemd.services.libvirtd.serviceConfig.ExitType = "idle-timeout";
  systemd.services.libvirtd.serviceConfig.ExecStart = [ 
    "" 
    "${pkgs.libvirt}/bin/libvirtd --timeout 120" 
  ];
}