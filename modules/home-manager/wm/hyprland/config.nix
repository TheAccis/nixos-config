{ config, meta, ... }:
{
	programs."${meta.apps.shell}".initContent = ''
		if command -v uwsm > /dev/null && uwsm check may-start; then
			exec systemd-cat -t uwsm_start uwsm start hyprland-uwsm.desktop
		fi
	'';

	wayland.windowManager.hyprland = {
		enable = true;
		systemd.enable = true;
	};

	wayland.windowManager.hyprland.settings = {
		"$main-button" = "SUPER";

		env = [
			"NIXOS_OZONE_WL,1"
			"XDG_CURRENT_DESKTOP,Hyprland"
			"XDG_SESSION_TYPE,wayland"
			"XDG_SESSION_DESKTOP,Hyprland"
			"QT_QPA_PLATFORM,wayland"

			"XCURSOR_THEME,${config.stylix.cursor.name}"
			"XCURSOR_SIZE,${toString config.stylix.cursor.size}"
			"HYPRCURSOR_THEME,${config.stylix.cursor.name}"
			"HYPRCURSOR_SIZE,${toString config.stylix.cursor.size}"
		];

		monitor = ",highres,auto,1.0";

		xwayland.force_zero_scaling = true;

		cursor.no_hardware_cursors = true;

		exec-once = [
			"wl-paste --type text --watch cliphist store"
			"wl-paste --type image --watch cliphist store"
		];

		general = {
			#gaps_in = 10;
			gaps_out = 10;

			border_size = 3;

			"col.active_border" = "rgba(d65d0eff) rgba(701a98ff) 45deg";
			"col.inactive_border" = "rgba(3c3836ff)";

			resize_on_border = true;

			allow_tearing = false;
		};

		decoration = {
			rounding = 25;

			active_opacity = 1.0;
			inactive_opacity = 1.0;

			dim_inactive = true;
			dim_strength = 0.3;

			shadow.enabled = true;

			blur.enabled = false;
		};

		animations = {
			enabled = true;
		
			bezier = [
				"overshoot, 0.05, 0.9, 0.1, 1.1"
				"smooth, 0.16, 1.0, 0.3, 1.0"
				"spring, 0.64, 0.0, 0.36, 1.0"
				"linear, 0.0, 0.0, 1.0, 1.0"
			];
		
			animation = [
				"windows, 1, 8, overshoot, popin 85%"
				"workspaces, 1, 8, smooth, slide"
				"fade, 1, 8, smooth"
				"border, 1, 6, spring"
			];
		};

		input = {
			kb_layout = "us,ru";
			kb_options = "grp:alt_shift_toggle";

			touchpad.disable_while_typing = false;
		};

		gesture = [
			"3, horizontal, workspace, invert"
		];

		general.layout = "dwindle";
		dwindle = {
			pseudotile = true;
			preserve_split = true;
		};

		# general.layout = "master";
		# master = {
		# 	new_status = "slave";
		# 	new_on_top = true;
		# 	mfact = 0.5;
		# };

		misc = {
			force_default_wallpaper = 0;
			disable_hyprland_logo = true;
		};

		ecosystem.no_update_news = true;

		windowrulev2 = [
			"float,class:(mpv)|(showmethekey-gtk)"
			"move 990 60,size 900 170,pin,noinitialfocus,class:(showmethekey-gtk)"
			"noborder,nofocus,class:(showmethekey-gtk)"

			"suppressevent maximize, class:.*"
			"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
		];
	};
}