{ config, meta, ... }:
{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
			os-rebuild = "nh os switch";
			os-rebuild-test = "nh os test";
			os-update = "nh os switch --update";
			os-clean = ''
				sudo nix-collect-garbage -d --quiet
				echo 'Hard-linking files...'
				nix-store --optimise
			'';

      home-packages = "nix eval ${meta.config-path}#nixosConfigurations.$(hostname).config.home-manager.users.$(whoami).home.packages --json | jq -r '.[]' | sed -E 's|/nix/store/[a-z0-9]{32}-||' | sort -u";

			microfetch = "microfetch && echo";
			se = "sudoedit";

			blueon = "rfkill unblock bluetooth";
			blueoff = "rfkill block bluetooth";

			".." = "cd ..";
		};

		history.size = 1024;
		history.path = "${config.xdg.dataHome}/zsh/history";

		initContent = ''
			# FIXME: Fix console not working in rus keyboard
			stty -ixon # Remove Ctrl+C for send SIGINT

			nix-pkg-size() { nix path-info --closure-size --human-readable $(readlink -f $(which $1)) }

			function nix-whydep() {
				nix why-depends ~/.nix-profile "nixpkgs#$1" | sed -E 's/\/nix\/store\/[a-zA-Z0-9]+-//g'
			}
		'';
	};
}