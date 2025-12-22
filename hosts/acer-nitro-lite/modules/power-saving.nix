{
	#powerManagement = {
	#	enable = true;
	#	cpuFreqGovernor = "powersave";
	#};

	#services.tlp.enable = true;
	#services.tlp.settings = {
	#	CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
	#	CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
	#	CPU_MIN_PERF_ON_AC = 0;
	#	CPU_MAX_PERF_ON_AC = 100;
	#	CPU_MIN_PERF_ON_BAT = 5;
	#	CPU_MAX_PERF_ON_BAT = 50;
	#	SATA_LINKPWR_ON_BAT = "med_power_with_dipm";
	#	PCIE_ASPM_ON_BAT = "default";
	#	WIFI_PWR_ON_BAT = "on"; # Maybe need to stop
	#	SOUND_POWER_SAVE_ON_BAT = 1;
	#	SOUND_POWER_SAVE_CONTROLLER = "Y";
	#	USB_AUTOSUSPEND = 1;
	#	USB_EXCLUDE_AUDIO = "Y";
	#	USB_EXCLUDE_PRINTER = "Y";
	#	USB_EXCLUDE_WWAN = "Y";
	#	BAY_POWEROFF_ON_BAT = 1;
	#	RUNTIME_PM_ON_BAT = "auto";
	#	RUNTIME_PM_DRIVER_BLACKLIST = "mei_me nouveau";
	#};

	services.power-profiles-daemon.enable = true;
	services.thermald.enable = true;
	powerManagement.enable = true;
	services.upower.enable = true;
}