{ config, pkgs, userSettings, ... }:

{
  networking.hostName = userSettings.username;
  networking.networkmanager.enable = true;
}
