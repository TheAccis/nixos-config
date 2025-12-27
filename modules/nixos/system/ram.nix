{
	zramSwap = {
		enable = true;
		algorithm = "lz4";
		memoryPercent = 50;
		priority = 100;
	};

	boot.tmp.useTmpfs = true;
	boot.tmp.tmpfsSize = "25%";
}