{ inputs, ... }:
{
	imports = [ inputs.disko.nixosModules.disko ];

	disko.devices.disk.main = {
		device = "/dev/vda";
		type = "disk";

		content.type = "gpt";

		content.partitions.boot = {
			size = "1M";
			type = "EF02";
		};

		content.partitions.ESP = {
			priority = 1;
			size = "512M";
			type = "EF00";
			content = {
				type = "filesystem";
				format = "vfat";
				mountpoint = "/boot";
				mountOptions = [ "umask=0077" ];
			};
		};

		content.partitions.root = {
			size = "100%";
			content = {
				type = "filesystem";
				format = "ext4";
				mountpoint = "/";
			};
		};
	};
}