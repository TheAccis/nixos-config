{
	zramSwap = {
		enable = true;
		algorithm = "lz4";
		memoryPercent = 50;
		priority = 100;
	};

	swapDevices = [{
		device = "/dev/disk/by-label/swap";
		priority = 200;
	}];
}