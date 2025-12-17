{ pkgs, user, ... }:
{
	programs.zsh.enable = true;

	users.defaultUserShell = pkgs.zsh;

	users.users = {
		${user} = {
			hashedPassword = "$6$FaEVp7cERlE479aZ$NkjXrEekaLJQq4KGtPIjCKSQfpGXApMhJun92F3VDxX76C1t1aoMbzyQ2lxVXDtbdkB2eo07/C2MfI4t.2pSa.";
			isNormalUser = true;
			extraGroups = [
				"systemd-journal"
				"networkmanager"
				"wheel"
				"audio"
				"video"
				"input"
			];
		};

		root = {
			hashedPassword = "$6$bva6D7S3nHLiDEJq$UhtuJ0rqZIrUzi1Ifo6kF1mVJ4eERN4OESpeEjUg3n2vgVyRbnpWbQtWEsQ.TeeKVJ/Lv8bKnJgl76X.trUrN0";
		};
	};

	services.getty.autologinUser = user;
}