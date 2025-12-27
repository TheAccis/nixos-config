{
  # Audio
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		pulse.enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
	};

  # Bluetooth
	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = false;

  # Firmware
  hardware.enableRedistributableFirmware = true;
}