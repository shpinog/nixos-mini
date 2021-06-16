{ pkgs, config, ... }: {


#RDP

services.xrdp.enable = true;
services.xrdp.defaultWindowManager = "awesome";
networking.firewall.allowedTCPPorts = [ 3389 ];
networking.hostName = "nixos-mini";
programs.x2goserver.enable = true;

#

}
