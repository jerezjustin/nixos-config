{ config, pkgs, userSettings, ... }:

{

  networking.hostName = userSettings.username;
  networking.networkmanager.enable = true;
  
  networking.useDHCP = false;
  networking.defaultGateway = "192.168.100.1";
  networking.nameservers = [ "192.168.100.1" "8.8.8.8" ];
  networking.firewall.enable = true;

  # Setup bridge
  networking.bridges.br0.interfaces = [ "eno1" ];
  networking.interfaces.br0.ipv4.addresses = [{
      address = "192.168.100.60";
      prefixLength = 24;
  }];

  environment.systemPackages = with pkgs; [
    bridge-utils
  ];
}
