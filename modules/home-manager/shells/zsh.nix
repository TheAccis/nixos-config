{ osConfig, config, meta, ... }:
{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
			os-rebuild = "nh os switch";
			os-rebuild-switch = "nh os switch";
			os-rebuild-boot = "nh os boot";
			os-rebuild-test = "nh os test";
			os-update = "nh os switch --update";
			os-clean = "sudo nix-collect-garbage -d --quiet";

			boot-analyze = ''
				systemd-analyze
				systemd-analyze blame | head --lines 25
				systemd-analyze critical-chain
			'';

			show-packages = ''
				echo "-- System packages --"
				echo "${builtins.concatStringsSep "\n" (map (p: p.pname or p.name) osConfig.environment.systemPackages)}"

				echo "-- Home packages --"
				echo "${builtins.concatStringsSep "\n" (map (p: p.pname or p.name) config.home.packages)}"
			'';

			microfetch = "microfetch && echo";
			se = "sudoedit";
			c = "clear";

			blueon = "rfkill unblock bluetooth";
			blueoff = "rfkill block bluetooth";

			".." = "cd ..";
		};

		history.size = 1024;
		history.path = "${config.xdg.dataHome}/zsh/history";

		initContent = ''
			stty sane
			stty intr ^C
			stty -ixon

			nix-pkg-size() { nix path-info --closure-size --human-readable $(readlink -f $(which $1)) }

			function nix-whydep() {
				nix why-depends ~/.nix-profile "nixpkgs#$1" | sed -E 's/\/nix\/store\/[a-zA-Z0-9]+-//g'
			}
		'';
	};
}