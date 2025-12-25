{ pkgs, ... }:
{
	home.packages = with pkgs; [
		papirus-icon-theme
	];
	
	qt = {
		enable = true;
		platformTheme.name = "gtk";
		style = {
			package = pkgs.adwaita-qt;
			name = "adwaita-dark";
		};
	};

	home.sessionVariables = {
		QT_STYLE_OVERRIDE = "adwaita-dark";
	};
}