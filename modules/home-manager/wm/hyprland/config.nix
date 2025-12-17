{ config, ... }:
{
	wayland.windowManager.hyprland = {
		enable = true;
		systemd.enable = true;
	};

	wayland.windowManager.hyprland.settings = {
		"$main-button" = "SUPER";

		env = [
			# Hint Electron apps to use Wayland
			"NIXOS_OZONE_WL,1"
			"XDG_CURRENT_DESKTOP,Hyprland"
			"XDG_SESSION_TYPE,wayland"
			"XDG_SESSION_DESKTOP,Hyprland"
			"QT_QPA_PLATFORM,wayland"
			"XDG_SCREENSHOTS_DIR,$HOME/screens"

			# TODO: This code not working
			"XCURSOR_THEME,${config.stylix.cursor.name}"
			"XCURSOR_SIZE,${toString config.stylix.cursor.size}"
			"HYPRCURSOR_THEME,${config.stylix.cursor.name}"
			"HYPRCURSOR_SIZE,${toString config.stylix.cursor.size}"
		];

		monitor = ",highres,auto,1";

		xwayland.force_zero_scaling = true;

		exec-once = [
			"wl-paste --type text --watch cliphist store"
			"wl-paste --type image --watch cliphist store"
		];

		misc.vrr = false;

		general = {
			gaps_in = 10;
			gaps_out = 10;

			border_size = 3;

			"col.active_border" = "rgba(d65d0eff) rgba(98971aff) 45deg";
			"col.inactive_border" = "rgba(3c3836ff)";

			resize_on_border = true;

			allow_tearing = false;
			layout = "master";
		};

		decoration = {
			rounding = 25;

			active_opacity = 1.0;
			inactive_opacity = 0.8;

			shadow.enabled = true;

			blur.enabled = true;
		};

		animations.enabled = true;

		input = {
			kb_layout = "us,ru";
			kb_options = "grp:alt_shift_toggle";
		};

		gesture = [
			"3, horizontal, workspace, invert"
		];

		dwindle = {
			pseudotile = true;
			preserve_split = true;
		};

		master = {
			new_status = "slave";
			new_on_top = true;
			mfact = 0.5;
		};

		misc = {
			force_default_wallpaper = 0;
			disable_hyprland_logo = true;
		};

		windowrulev2 = [
			"float,class:(mpv)|(showmethekey-gtk)"
			"move 990 60,size 900 170,pin,noinitialfocus,class:(showmethekey-gtk)"
			"noborder,nofocus,class:(showmethekey-gtk)"

			"suppressevent maximize, class:.*"
			"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
		];
	};
}