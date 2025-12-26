{ inputs, ... }:
{
	imports = [ inputs.disko.nixosModules.disko ];

  # disko.devices.disk.main.device defined in host configs
  disko.devices.disk.main = {
		type = "disk";

		content.type = "gpt";

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
				type = "btrfs";
				extraArgs = [ "-f" ];
				subvolumes = {
					"/root" = {
						mountpoint = "/";
						mountOptions = [ "compress=zstd" "noatime" ];
					};
					"/home" = {
						mountpoint = "/home";
						mountOptions = [ "compress=zstd" "noatime" ];
					};
					"/nix" = {
						mountpoint = "/nix";
						mountOptions = [ "compress=zstd" "noatime" ];
					};
				};
			};
		};
	};
}