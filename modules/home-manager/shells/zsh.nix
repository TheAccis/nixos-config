{ config, ... }:
{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
			os-rebuild = "nh os switch";
			os-update = "nh os switch --update";
			os-clean = ''
				sudo nix-collect-garbage -d
				echo 'Hard-linking files...'
				nix-store --optimise
			'';

			microfetch = "microfetch && echo";
			se = "sudoedit";

			blueon = "rfkill unblock bluetooth";
			blueoff = "rfkill block bluetooth";

			".." = "cd ..";
		};

		history.size = 256;
		history.path = "${config.xdg.dataHome}/zsh/history";

		initContent = ''
			# Start UWSM session automatically
			if command -v uwsm > /dev/null && uwsm check may-start; then
				exec systemd-cat -t uwsm_start uwsm start hyprland-uwsm.desktop
			fi

			# FIXME: Fix console not working copy/paste sometimes
			stty -ixon # Remove Ctrl+C for send SIGINT

			nix-pkg-size() { nix path-info --closure-size --human-readable $(readlink -f $(which $1)) }

			function nix-whydep() {
				nix why-depends ~/.nix-profile "nixpkgs#$1" | sed -E 's/\/nix\/store\/[a-zA-Z0-9]+-//g'
			}
		'';
	};
}