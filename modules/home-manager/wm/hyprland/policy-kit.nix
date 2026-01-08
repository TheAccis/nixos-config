{ pkgs, ... }:
let
	target = "graphical-session.target";
in {
	home.packages = [ pkgs.hyprpolkitagent ];

	systemd.user.services.hyprpolkitagent = {
		Unit = {
			Description = "Hyprland Polkit Authentication Agent";
			WantedBy = [ target ];
			After = [ target ];
		};

		Service = {
			ExecStart = "${pkgs.hyprpolkitagent}/bin/hyprpolkitagent";
			Restart = "on-failure";
		};

		Install = {
			WantedBy = [ target ];
		};
	};
}