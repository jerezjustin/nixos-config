{ config, pkgs, userSettings, ... }:

{
  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    mangohud
  ];
}