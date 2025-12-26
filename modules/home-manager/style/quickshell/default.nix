{
	programs.quickshell = {
		enable = true;
		package = inputs.quickshell.packages.${pkgs.system}.default;
		systemd.enable = true;
	};
}