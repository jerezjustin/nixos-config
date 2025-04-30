{ config, pkgs, lib, userSettings, ... }:

{
  networking.hostName = userSettings.username;
  networking.networkmanager.enable = true;
  
  networking.useDHCP = lib.mkDefault true;
  networking.firewall.enable = true;

  environment.systemPackages = with pkgs; [
    bridge-utils
  ];
}
