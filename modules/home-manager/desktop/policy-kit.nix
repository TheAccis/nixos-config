{ pkgs, ... }:

let
	target = "graphical-session.target";
in
{
	home.packages = [ pkgs.lxqt.lxqt-policykit ];

	systemd.user.services.lxqt-policykit-agent = {
		Unit = {
			Description = "LXQt Polkit Authentication Agent";
			WantedBy = [ target ];
			Wants = [ target ];
			After = [ target ];
		};

		Service = {
			Type = "simple";
			ExecStart = "${pkgs.lxqt.lxqt-policykit}/bin/lxqt-policykit-agent";
			Restart = "on-failure";
			RestartSec = 1;
			TimeoutStopSec = 10;
		};

		Install = {
			WantedBy = [ target ];
		};
	};
}