{ version, hostname, ... }:
{
	networking.hostName = hostname;

	system.stateVersion = version;
}