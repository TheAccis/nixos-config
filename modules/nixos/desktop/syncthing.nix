{ meta, pkgs, ... }:
{
	services.syncthing = {
		enable = true;
		user = meta.user;
		systemService = false;
		package = pkgs.syncthing;
		openDefaultPorts = true;
		guiAddress = "127.0.0.1:8384";
	};

	services.syncthing.settings.folders = {
		obsidian = {
			path = "${meta.home}/${meta.dirs.documents}/obsidian-vault";
			label = "Obsidian Vault";
			type = "sendreceive";
			versioning = { type = "simple"; };
			devices = [];
		};
	};
}