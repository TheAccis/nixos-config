{ pkgs, ... }:

let
	steam-adwaita-src = pkgs.fetchFromGitHub {
		owner = "Foldex";
		repo = "Adwaita-for-Steam";
		rev = "v1.6";
		sha256 = "sha256-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX="; 
	};
in
{
	home.file.".local/share/Steam/steamui/adwaita" = {
		source = "${steam-adwaita-src}/adwaita";
		recursive = true;
	};

	home.file.".local/share/Steam/steamui/libraryroot.custom.css".text = ''
		/* Main Files */
		@import url("https://steamloopback.host/adwaita/adwaita.css");

		/* Font */
		@import url("https://steamloopback.host/adwaita/fonts/adwaita/adwaita.css");

		/* Window controls theme */
		@import url("https://steamloopback.host/adwaita/windowcontrols/adwaita.css");

		/* Window controls layout - appmenu:close */
		:root
		{
			--adw-windowcontrols-left-has-buttons: 0;
			--adw-windowcontrols-left-buttons: 0;
			--adw-windowcontrols-right-has-buttons: 1;
			--adw-windowcontrols-right-buttons: 1;
			--adw-windowcontrols-close-margin-left: calc(0 * (var(--adw-windowcontrols-buttons-margin-outer) + var(--adw-windowcontrols-button-width) + var(--adw-windowcontrols-buttons-margin-inner)));
			--adw-windowcontrols-close-margin-right: calc(1 * (var(--adw-windowcontrols-buttons-margin-outer) + var(--adw-windowcontrols-button-width) + var(--adw-windowcontrols-buttons-margin-inner)));
		}

		body.DesktopUI,
		html.client_chat_frame
		{
			.title-bar-actions .title-area-icon
			{
				visibility: hidden !important;

				&.closeButton
				{
					visibility: visible !important;
					right: calc(var(--adw-windowcontrols-buttons-margin-outer) + 0 * var(--adw-windowcontrols-button-width) + 0 * var(--adw-windowcontrols-button-gap)) !important;

					html.client_chat_frame div.chat_main.singlewindow div.friendsListContainer:not(.collapsed) &
					{
						visibility: hidden !important;
					}
				}
			}
		}
	'';
}