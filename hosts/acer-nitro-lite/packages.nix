{ pkgs, ... }: 
{
	environment.systemPackages = with pkgs; 
	[
		upower
	];
}