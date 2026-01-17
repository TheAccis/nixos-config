{ hostname, pkgs, ... }:
{
	networking = {
		modemmanager.enable = false;
		firewall.enable = false;
		hostName = hostname;

		networkmanager = {
			enable = true;
			wifi.powersave = false;
			dns = "default";
			#dns = "none";
		};

		nameservers = [ ];
	};

#services.unbound = {
#  enable = true;
#  settings = {
#    server = {
#      interface = [ "127.0.0.1" ];
#      verbosity = 1;
#      # можно включить remote-control, если нужен контроль
#      # remote-control: { control-enable = true; };
#    };
#    forward-zone = [
#      {
#        name = ".";
#        forward-first = true;
#        forward-addr = [ "1.1.1.1" "1.0.0.1" "8.8.8.8" ];
#      }
#    ];
#  };
#};
#
## Гарантируем, что /etc/resolv.conf будет указывать на localhost
#environment.etc."resolv.conf".text = ''
#nameserver 127.0.0.1
#options edns0
#'';

	systemd.services."NetworkManager-wait-online".enable = false;
	systemd.services."resolvconf".enable = false;
}