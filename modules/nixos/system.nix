{ hostname, meta, ... }:
{
	networking.hostName = hostname;

	system.stateVersion = meta.version;
}