{ lib, ... }:
{
	programs.alacritty.enable = true;
	programs.alacritty.settings = {
		window.opacity = 1.0;

		font.builtin_box_drawing = true;
		font.normal.style = lib.mkForce "Bold";

		# FIXME: Fix copy/paste
		keyboard.bindings = [
			{ key = "C"; mods = "Control"; action = "Copy"; }
			{ key = "V"; mods = "Control"; action = "Paste"; }
			{ key = "C"; mods = "Control|Shift"; chars = "\x03"; } # Send SIGINT (\x03) to kill process
		];
	};
}