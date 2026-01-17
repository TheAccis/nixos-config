{ pkgs, meta, ... }:
{
	wayland.windowManager.hyprland.settings = {
		bind = [
			"$main-button,				Q, exec, ${meta.apps.terminal.command}"
			"$main-button,				C, killactive,"
			"$main-button SHIFT,	Q, exit,"
			"$main-button,				F, togglefloating,"
			"$main-button,				F11, fullscreen"
			"$main-button,				R, exec, apps_menu"
			"$main-button SHIFT,	R, exec, apps_menu_extended"
			"$main-button,				P, pin,"
			"$main-button,				J, togglesplit,"
			"$main-button,				E, exec, ${meta.apps.file-manager.command}"
			"$main-button,				L, exec, loginctl lock-session"
			# "$main-button,				P, exec, hyprpicker -an"
			"$main-button,				N, exec, swaync-client -t"

			# Moving focus
			"$main-button, left,	movefocus, l"
			"$main-button, right,	movefocus, r"
			"$main-button, up,		movefocus, u"
			"$main-button, down,	movefocus, d"

			# Moving windows
			"$main-button SHIFT, left,  swapwindow, l"
			"$main-button SHIFT, right, swapwindow, r"
			"$main-button SHIFT, up,    swapwindow, u"
			"$main-button SHIFT, down,  swapwindow, d"

			# Switching workspaces
			"$main-button, 1, workspace, 1"
			"$main-button, 2, workspace, 2"
			"$main-button, 3, workspace, 3"
			"$main-button, 4, workspace, 4"
			"$main-button, 5, workspace, 5"
			"$main-button, 6, workspace, 6"
			"$main-button, 7, workspace, 7"
			"$main-button, 8, workspace, 8"
			"$main-button, 9, workspace, 9"
			"$main-button, 0, workspace, 10"

			# Moving windows to workspaces
			"$main-button SHIFT, 1, movetoworkspacesilent, 1"
			"$main-button SHIFT, 2, movetoworkspacesilent, 2"
			"$main-button SHIFT, 3, movetoworkspacesilent, 3"
			"$main-button SHIFT, 4, movetoworkspacesilent, 4"
			"$main-button SHIFT, 5, movetoworkspacesilent, 5"
			"$main-button SHIFT, 6, movetoworkspacesilent, 6"
			"$main-button SHIFT, 7, movetoworkspacesilent, 7"
			"$main-button SHIFT, 8, movetoworkspacesilent, 8"
			"$main-button SHIFT, 9, movetoworkspacesilent, 9"
			"$main-button SHIFT, 0, movetoworkspacesilent, 10"
		];

		# Move/resize windows with main-button + LMB/RMB and dragging
		bindm = [
			"$main-button, mouse:272, movewindow"
			"$main-button, mouse:273, resizewindow"
		];

		bindel = [
			# Resizing windows                        X  Y
			"$main-button CTRL, left,  resizeactive, -25 0"
			"$main-button CTRL, right, resizeactive,  25 0"
			"$main-button CTRL, up,    resizeactive,  0 -25"
			"$main-button CTRL, down,  resizeactive,  0  25"

			# Set volume (laptop keys)
			"$main-button, XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
			"$main-button, XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
			"$main-button, XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
			"$main-button, XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
			"$main-button, XF86Launch6,           exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

			# Set brightness (laptop keys)
			"$main-button, XF86MonBrightnessDown, exec, brightnessctl s 10%-"
			"$main-button, XF86MonBrightnessUp,   exec, brightnessctl s 10%+"
		];
	};
}